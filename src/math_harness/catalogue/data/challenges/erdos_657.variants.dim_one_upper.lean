import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos657

theorem erdos_657.variants.dim_one_upper :
    ∃ C > (0 : ℝ), ∀ᶠ n : ℕ in atTop, ∃ A : Finset ℝ, A.card = n ∧ (A : Set ℝ).IsIsoscelesFree ∧ (distinctDistances A : ℝ) ≤ (n : ℝ) * (2 : ℝ) ^ (C * √(Real.log n)) := by
  sorry

end Erdos657
