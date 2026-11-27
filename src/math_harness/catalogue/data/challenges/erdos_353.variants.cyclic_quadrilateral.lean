import Mathlib

open Affine EuclideanGeometry MeasureTheory

open scoped Real

namespace Erdos353

theorem erdos_353.variants.cyclic_quadrilateral :
    ∀ A : Set ℝ², MeasurableSet A → volume A = ⊤ → ∃ Q : Set ℝ², Q ⊆ A ∧ Q.ncard = 4 ∧ Cospherical Q ∧ volume (convexHull ℝ Q) = 1 := by
  sorry

end Erdos353
