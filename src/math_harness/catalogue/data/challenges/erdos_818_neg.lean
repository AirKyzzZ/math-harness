import Mathlib

open scoped Pointwise

namespace Erdos818

theorem erdos_818_neg :
    ¬ (∀ K : ℝ, 0 < K → ∃ C : ℝ, 0 < C ∧ ∃ c : ℝ, 0 < c ∧ ∀ A : Finset ℤ, 2 ≤ A.card → ((A + A).card : ℝ) ≤ K * (A.card : ℝ) → c * (A.card : ℝ) ^ 2 / (Real.log (A.card : ℝ)) ^ C ≤ ((A * A).card : ℝ)) := by
  sorry

end Erdos818
