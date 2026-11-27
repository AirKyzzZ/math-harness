import Mathlib

open Affine EuclideanGeometry MeasureTheory

open scoped Real

namespace Erdos353

theorem erdos_353.variants.right_angled_triangle :
    ∀ A : Set ℝ², MeasurableSet A → volume A = ⊤ → ∃ a ∈ A, ∃ b ∈ A, ∃ c ∈ A, IsRightAngled a b c ∧ volume (convexHull ℝ {a, b, c}) = 1 := by
  sorry

end Erdos353
