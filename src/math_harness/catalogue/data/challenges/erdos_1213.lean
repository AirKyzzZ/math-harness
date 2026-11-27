import Mathlib

namespace Erdos1213

def HasEqualIntervalSums (A : ℕ → ℕ) (s : ℕ) : Prop :=
  ∃ u v x y : ℕ, u < v ∧ v ≤ s ∧ x < y ∧ y ≤ s ∧ (u, v) ≠ (x, y) ∧
    ∑ i ∈ Finset.Ico u v, A i = ∑ i ∈ Finset.Ico x y, A i

theorem erdos_1213 :
    ∀ a K : ℕ, 1 ≤ a → 1 ≤ K → ∃ f : ℕ, ∀ (s : ℕ) (A : ℕ → ℕ), 0 < s → A 0 = a → StrictMonoOn A (Set.Iio s) → (∀ i, i + 1 < s → A (i + 1) - A i ≤ K) → f < A (s - 1) → HasEqualIntervalSums A s := by
  sorry

end Erdos1213
