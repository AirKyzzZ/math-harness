import Mathlib

open Filter

namespace Erdos875

def rSums (A : Set ℕ) (r : ℕ) : Set ℕ :=
  {s | ∃ T : Finset ℕ, (T : Set ℕ) ⊆ A ∧ T.card = r ∧ ∑ x ∈ T, x = s}

def IsAdmissible (A : Set ℕ) : Prop :=
  (Set.Ici (1 : ℕ)).PairwiseDisjoint (rSums A)

noncomputable def countingFunction (A : Set ℕ) (x : ℕ) : ℕ :=
  (A ∩ Set.Iic x).ncard

noncomputable def gap (A : Set ℕ) (n : ℕ) : ℕ :=
  Nat.nth (· ∈ A) n - Nat.nth (· ∈ A) (n - 1)

theorem rSums_one (A : Set ℕ) : rSums A 1 = A := by
  ext s
  constructor
  · rintro ⟨T, hT, hc, rfl⟩
    obtain ⟨a, rfl⟩ := Finset.card_eq_one.mp hc
    simpa using hT
  · intro hs
    exact ⟨{s}, by simpa using hs, by simp, by simp⟩

theorem erdos_875.variants.erdos_nicolas_sarkozy :
    ∃ A : Set ℕ, A.Infinite ∧ IsAdmissible A ∧ ∃ c : ℝ, 0 < c ∧ ∀ᶠ x : ℕ in atTop, c * (x : ℝ) ^ (5 - 2 * Real.sqrt 6) ≤ (countingFunction A x : ℝ) := by
  sorry

end Erdos875
