import Mathlib

open Filter Asymptotics

namespace Erdos725

abbrev IsLatinRectangle {k n : ℕ} (M : Fin k → Fin n → Fin n) : Prop :=
  (∀ i, Function.Injective (M i)) ∧ ∀ j, Function.Injective fun i ↦ M i j

noncomputable def L (k n : ℕ) : ℕ :=
  Nat.card {M : Fin k → Fin n → Fin n // IsLatinRectangle M}

theorem L_one (n : ℕ) : L 1 n = n.factorial := by
  have e : {M : Fin 1 → Fin n → Fin n // IsLatinRectangle M} ≃ Equiv.Perm (Fin n) :=
    { toFun := fun M ↦ Equiv.ofBijective (M.1 0) (Finite.injective_iff_bijective.1 (M.2.1 0))
      invFun := fun σ ↦ ⟨fun _ ↦ σ, fun _ ↦ σ.injective, fun _ a b _ ↦ Subsingleton.elim a b⟩
      left_inv := fun M ↦ by
        refine Subtype.ext (funext fun i ↦ ?_)
        have hi : i = 0 := Subsingleton.elim i 0
        subst hi
        rfl
      right_inv := fun σ ↦ Equiv.ext fun _ ↦ rfl }
  unfold L
  rw [Nat.card_congr e, Nat.card_perm, Nat.card_eq_fintype_card, Fintype.card_fin]

theorem erdos_725.variants.yamamoto (δ : ℕ → ℝ) (hδ : Tendsto (fun n : ℕ ↦ (n : ℝ) ^ (-δ n)) atTop (nhds 0)) (k : ℕ → ℕ) (hk : ∀ᶠ n in atTop, (k n : ℝ) < (n : ℝ) ^ (1 / 3 - δ n)) :
    (fun n ↦ (L (k n) n : ℝ)) ~[atTop] fun n ↦ Real.exp (-((k n).choose 2 : ℝ)) * (n.factorial : ℝ) ^ k n := by
  sorry

end Erdos725
