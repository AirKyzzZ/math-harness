import Mathlib

open scoped EuclideanGeometry

open scoped ProbabilityTheory

namespace Erdos352

theorem erdos_352 :
    ∃ c > (0: ℝ), ∀ A : Set ℝ², MeasurableSet A → ℙ A ≥ c.toEReal → (∃ t : Affine.Triangle ℝ ℝ², (∀ p : Fin 3, t.points p ∈ A) ∧ EuclideanGeometry.triangle_area (t.points 0) (t.points 1) (t.points 2) = 1) := by
  sorry

end Erdos352
