import Mathlib

open Affine

open scoped Congruent EuclideanGeometry

namespace Erdos173

def HasMonochromaticCopy (c : ℝ² → Fin 2) (T : Triangle ℝ ℝ²) : Prop :=
  ∃ T' : Triangle ℝ ℝ², (T'.points ≅ T.points) ∧ ∃ i, ∀ j, c (T'.points j) = i

theorem erdos_173.variants.equilateral_exception :
    ∃ (c : ℝ² → Fin 2) (T : Triangle ℝ ℝ²), dist (T.points 0) (T.points 1) = dist (T.points 1) (T.points 2) ∧ dist (T.points 1) (T.points 2) = dist (T.points 2) (T.points 0) ∧ ¬ HasMonochromaticCopy c T := by
  sorry

end Erdos173
