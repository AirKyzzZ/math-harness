import Mathlib

open scoped Pointwise

namespace Erdos818

theorem erdos_818.variants.solymosi :
    ∀ K : ℝ, 0 < K → ∃ c : ℝ, 0 < c ∧ ∀ A : Finset ℤ, 2 ≤ A.card → ((A + A).card : ℝ) ≤ K * (A.card : ℝ) → c * (A.card : ℝ) ^ 2 / Real.log (A.card : ℝ) ≤ ((A * A).card : ℝ) := by
  sorry

end Erdos818
