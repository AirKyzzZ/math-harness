import Mathlib

open Affine

open scoped Congruent EuclideanGeometry

namespace Erdos173

def HasMonochromaticCopy (c : ℝ² → Fin 2) (T : Triangle ℝ ℝ²) : Prop :=
  ∃ T' : Triangle ℝ ℝ², (T'.points ≅ T.points) ∧ ∃ i, ∀ j, c (T'.points j) = i

theorem erdos_173.variants.right_triangle (c : ℝ² → Fin 2) (T : Triangle ℝ ℝ²) (hT : ∠ (T.points 0) (T.points 1) (T.points 2) = Real.pi / 2) :
    HasMonochromaticCopy c T := by
  sorry

end Erdos173
