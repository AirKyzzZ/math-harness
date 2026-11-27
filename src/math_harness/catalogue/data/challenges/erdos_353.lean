import Mathlib

open Affine EuclideanGeometry MeasureTheory

open scoped Real

namespace Erdos353

theorem erdos_353 :
    ∀ A : Set ℝ², MeasurableSet A → volume A = ⊤ → ∃ a ∈ A, ∃ b ∈ A, ∃ c ∈ A, ∃ d ∈ A, IsIsoscelesTrapezoid a b c d ∧ volume (convexHull ℝ {a, b, c, d}) = 1 := by
  sorry

end Erdos353
