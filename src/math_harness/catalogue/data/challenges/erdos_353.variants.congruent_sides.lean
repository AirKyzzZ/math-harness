import Mathlib

open Affine EuclideanGeometry MeasureTheory

open scoped Real

namespace Erdos353

theorem erdos_353.variants.congruent_sides :
    ∃ A : Set ℝ², MeasurableSet A ∧ volume A = ⊤ ∧ ∀ (n : ℕ) (v : Fin (n + 3) → ℝ²), IsCcwConvexPolygon v → (∀ i, v i ∈ A) → (∀ i, dist (v i) (v (i + 1)) = dist (v 0) (v 1)) → volume (convexHull ℝ (Set.range v)) < 1 := by
  sorry

end Erdos353
