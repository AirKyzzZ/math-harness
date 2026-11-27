import Mathlib

open Filter Finset

namespace Erdos724

def IsOrthogonal {n : ℕ} (L M : LatinSquare n) : Prop :=
  Function.Injective fun p : Fin n × Fin n => (L.mat p.1 p.2, M.mat p.1 p.2)

noncomputable def maxMOLS (n : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ S : Finset (LatinSquare n), #S = k ∧
    (S : Set (LatinSquare n)).Pairwise IsOrthogonal}

theorem erdos_724 :
    ∃ c > (0 : ℝ), ∀ᶠ n : ℕ in atTop, c * Real.sqrt (n : ℝ) ≤ (maxMOLS n : ℝ) := by
  sorry

def latinSquare10Mat : Matrix (Fin 10) (Fin 10) (Fin 10) :=
  !![0, 1, 2, 3, 4, 5, 6, 7, 8, 9;
    1, 0, 5, 2, 7, 9, 8, 3, 6, 4;
    8, 6, 0, 9, 1, 3, 7, 2, 4, 5;
    5, 8, 1, 6, 3, 0, 9, 4, 7, 2;
    4, 5, 6, 0, 2, 7, 3, 9, 1, 8;
    7, 2, 9, 5, 8, 1, 4, 6, 0, 3;
    2, 4, 3, 7, 5, 6, 1, 8, 9, 0;
    9, 7, 8, 1, 0, 4, 2, 5, 3, 6;
    6, 3, 4, 8, 9, 2, 0, 1, 5, 7;
    3, 9, 7, 4, 6, 8, 5, 0, 2, 1]

def orthogonalMate10Mat : Matrix (Fin 10) (Fin 10) (Fin 10) :=
  !![0, 1, 2, 3, 4, 5, 6, 7, 8, 9;
    9, 7, 1, 5, 6, 8, 3, 2, 4, 0;
    7, 0, 3, 6, 5, 4, 8, 9, 1, 2;
    6, 5, 4, 9, 0, 1, 7, 8, 2, 3;
    2, 3, 8, 4, 7, 0, 9, 5, 6, 1;
    3, 4, 0, 8, 2, 7, 5, 1, 9, 6;
    8, 6, 7, 1, 9, 2, 0, 4, 3, 5;
    4, 9, 6, 2, 8, 3, 1, 0, 5, 7;
    5, 8, 9, 0, 1, 6, 2, 3, 7, 4;
    1, 2, 5, 7, 3, 9, 4, 6, 0, 8]

def latinSquare10 : LatinSquare 10 where
  mat := latinSquare10Mat
  row_injective := by
    show ∀ i, Function.Injective fun j ↦ latinSquare10Mat i j
    decide +kernel
  col_injective := by
    show ∀ j, Function.Injective fun i ↦ latinSquare10Mat i j
    decide +kernel

def orthogonalMate10 : LatinSquare 10 where
  mat := orthogonalMate10Mat
  row_injective := by
    show ∀ i, Function.Injective fun j ↦ orthogonalMate10Mat i j
    decide +kernel
  col_injective := by
    show ∀ j, Function.Injective fun i ↦ orthogonalMate10Mat i j
    decide +kernel

theorem erdos_724.variants.euler_conjecture :
    ¬ ∀ n : ℕ, n ≡ 2 [MOD 4] → maxMOLS n = 1 := by
  intro h
  have hLM : IsOrthogonal latinSquare10 orthogonalMate10 := by
    unfold IsOrthogonal
    decide +kernel
  have hne : latinSquare10 ≠ orthogonalMate10 := fun h' ↦
    absurd (congrArg (fun L : LatinSquare 10 ↦ L.mat 1 0) h') (by decide +kernel)
  have h2 : 2 ≤ maxMOLS 10 := by
    classical
    refine le_csSup ⟨Fintype.card (LatinSquare 10), ?_⟩
      ⟨{latinSquare10, orthogonalMate10}, card_pair hne, ?_⟩
    · rintro k ⟨S, rfl, -⟩
      exact card_le_univ S
    · rw [coe_pair, Set.pairwise_pair]
      exact fun _ ↦ ⟨hLM, fun p q hpq ↦ hLM (congrArg Prod.swap hpq)⟩
  have := h 10 rfl
  omega

theorem erdos_724.variants.le_sub_one :
    ∀ n : ℕ, 2 ≤ n → maxMOLS n ≤ n - 1 := by
  intro n hn
  apply csSup_le'
  rintro k ⟨S, rfl, hS⟩
  let i0 : Fin n := ⟨0, by omega⟩
  let i1 : Fin n := ⟨1, by omega⟩
  have h01 : i0 ≠ i1 := by simp [i0, i1, Fin.ext_iff]
  -- `c L` is the column of row `i0` that holds the symbol of cell `(i1, i0)`.
  let c : LatinSquare n → Fin n := fun L ↦
    (Equiv.ofBijective (L.mat i0) (Finite.injective_iff_bijective.1 (L.row_injective i0))).symm
      (L.mat i1 i0)
  have hc : ∀ L : LatinSquare n, L.mat i0 (c L) = L.mat i1 i0 := fun L ↦
    Equiv.ofBijective_apply_symm_apply _ _ _
  -- `c L ≠ i0`, since column `i0` has no repeated symbol.
  have hc0 : ∀ L : LatinSquare n, c L ≠ i0 := by
    intro L h
    have h' := hc L
    rw [h] at h'
    exact h01 (L.col_injective i0 h')
  -- Orthogonal squares have different `c`: otherwise their pairs agree at `(i0, c)` and `(i1, i0)`.
  have hinj : Set.InjOn c S := by
    intro L hL M hM hLM
    by_contra hne
    have horth : IsOrthogonal L M := hS hL hM hne
    have := @horth (i0, c L) (i1, i0)
      (show (L.mat i0 (c L), M.mat i0 (c L)) = (L.mat i1 i0, M.mat i1 i0) by
        rw [hc L, hLM, hc M])
    exact h01 (congrArg Prod.fst this)
  calc #S = #(S.image c) := (Finset.card_image_of_injOn hinj).symm
    _ ≤ #((Finset.univ : Finset (Fin n)).erase i0) := Finset.card_le_card fun x hx ↦ by
        obtain ⟨L, -, rfl⟩ := Finset.mem_image.1 hx
        exact Finset.mem_erase.2 ⟨hc0 L, Finset.mem_univ _⟩
    _ = n - 1 := by rw [Finset.card_erase_of_mem (Finset.mem_univ _), Finset.card_univ,
        Fintype.card_fin]

end Erdos724
