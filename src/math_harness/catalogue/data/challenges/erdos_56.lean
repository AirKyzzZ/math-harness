import Mathlib

open scoped Finset

namespace Erdos56

def WeaklyDivisible (k : ℕ) (A : Finset ℕ) : Prop :=
    ∀ s ∈ A.powersetCard (k + 1), ¬ Set.Pairwise s Nat.Coprime

lemma weaklyDivisible_empty (k : ℕ): WeaklyDivisible k {} := by
  simp [WeaklyDivisible]

lemma weaklyDivisible_singleton {k : ℕ} (hk : k ≠ 0) (l : ℕ) : WeaklyDivisible k {l} := by
  simp [WeaklyDivisible, hk]

lemma not_weaklyDivisible_zero {A : _} (h : A.Nonempty) : ¬WeaklyDivisible 0 A := by
  simpa [WeaklyDivisible] using ⟨{_}, by simpa using h.choose_spec⟩

lemma empty_iff_weaklyDivisible_zero {A : _} : WeaklyDivisible 0 A ↔ A = ∅ :=
  ⟨fun h ↦ Finset.not_nonempty_iff_eq_empty.1 <| mt not_weaklyDivisible_zero (not_not.2 h),
    fun h ↦ h ▸ weaklyDivisible_empty _⟩

noncomputable def MaxWeaklyDivisible (N : ℕ) (k : ℕ) : ℕ :=
  sSup {#A | (A : Finset ℕ) (_ : A ⊆ Finset.Icc 1 N) (_ : WeaklyDivisible k A)}

theorem maxWeaklyDivisible_zero : ∀ k : ℕ, MaxWeaklyDivisible 0 k = 0 := by
  intro k
  simp [MaxWeaklyDivisible, Nat.sSup_def]

theorem maxWeaklyDivisible_one {k : ℕ} (hk : k ≠ 0) : MaxWeaklyDivisible 1 k = 1 := by
  have : {x | ∃ A, WeaklyDivisible k A ∧ (A = ∅ ∨ A = {1}) ∧ #A = x} = {0, 1} := by
    refine Set.ext fun _ => ⟨fun _ => by aesop, ?_⟩
    rintro ⟨_, _⟩
    · simpa using weaklyDivisible_empty k
    · exact ⟨{1}, by simp_all [weaklyDivisible_singleton hk 1]⟩
  simp_all [MaxWeaklyDivisible]

theorem maxWeaklyDivisible_zero_k (N : ℕ) : MaxWeaklyDivisible N 0 = 0 := by
  simp [empty_iff_weaklyDivisible_zero, MaxWeaklyDivisible]

noncomputable def FirstPrimesMultiples (N k : ℕ) : Finset ℕ :=
    (Finset.Icc 1 N).filter fun i => ∃ j < k, (j.nth Nat.Prime ∣ i)

theorem firstPrimesMultiples_one_card_zero (k : ℕ) : (FirstPrimesMultiples 1 k).card = 0 := by
  simp [FirstPrimesMultiples, Finset.filter_singleton]
  intro n h
  by_contra hprime
  have : Nat.Prime 1 := by
    convert Nat.prime_nth_prime n
    exact hprime.symm
  tauto

theorem firstPrimesMultiples_zero_k_card_zero (N : ℕ) : (FirstPrimesMultiples N 0).card = 0 := by
  simp [FirstPrimesMultiples]

lemma weaklyDivisible_firstPrimesMultiples (N k : ℕ) :
    WeaklyDivisible k (FirstPrimesMultiples N k) := by
  unfold WeaklyDivisible
  intro s hs
  rw [Finset.mem_powersetCard] at hs
  -- Define the map from s to Fin k
  set f : s → Fin k := fun ⟨x, hx⟩ =>
    have h_exists := (Finset.mem_filter.mp (hs.1 hx)).2
    ⟨Classical.choose h_exists, (Classical.choose_spec h_exists).1⟩
  have hcard_s : Fintype.card s = k + 1 := by simp [hs.2]
  have hcard_fink : Fintype.card (Fin k) = k := Fintype.card_fin k
  obtain ⟨x, y, hne, heq⟩ := Fintype.exists_ne_map_eq_of_card_lt f (by omega)
  intro h_pair
  have hne_val : x.1 ≠ y.1 := by
    intro h_eq
    exact hne (Subtype.ext h_eq)
  have h_coprime := h_pair x.2 y.2 hne_val
  set p := (f x).val.nth Nat.Prime
  have hp_prime : p.Prime := Nat.prime_nth_prime _
  have hp_div_x : p ∣ x.1 := by
    have h_exists := (Finset.mem_filter.mp (hs.1 x.2)).2
    exact (Classical.choose_spec h_exists).2
  have hp_div_y : p ∣ y.1 := by
    have h_exists := (Finset.mem_filter.mp (hs.1 y.2)).2
    have h_eq_f : (f x).val = (f y).val := by rw [heq]
    -- (f y).val is Classical.choose h_exists by definition
    have : p = (Classical.choose h_exists).nth Nat.Prime := by
      dsimp [p]
      rw [h_eq_f]
    rw [this]
    exact (Classical.choose_spec h_exists).2
  have hp_div_gcd : p ∣ x.1.gcd y.1 := Nat.dvd_gcd hp_div_x hp_div_y
  have h_gcd_eq_one : x.1.gcd y.1 = 1 := h_coprime
  rw [h_gcd_eq_one] at hp_div_gcd
  have hp_le_one : p ≤ 1 := Nat.le_of_dvd (by norm_num) hp_div_gcd
  have : p > 1 := hp_prime.one_lt
  omega

theorem erdos_56 :
    ¬ ∀ᵉ (k > 0) (N ≥ (k-1).nth Nat.Prime), (MaxWeaklyDivisible N k = (FirstPrimesMultiples N k).card) := by
  sorry

end Erdos56
