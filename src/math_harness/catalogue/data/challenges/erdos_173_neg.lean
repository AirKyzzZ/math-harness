import Mathlib

open Affine

open scoped Congruent EuclideanGeometry

namespace Erdos173

def HasMonochromaticCopy (c : ℝ² → Fin 2) (T : Triangle ℝ ℝ²) : Prop :=
  ∃ T' : Triangle ℝ ℝ², (T'.points ≅ T.points) ∧ ∃ i, ∀ j, c (T'.points j) = i

theorem erdos_173_neg :
    ¬ (∀ (c : ℝ² → Fin 2) (T₁ T₂ : Triangle ℝ ℝ²), ¬ HasMonochromaticCopy c T₁ → ¬ HasMonochromaticCopy c T₂ → ∃ σ : Equiv.Perm (Fin 3), T₁.points ∘ σ ≅ T₂.points) := by
  sorry

end Erdos173
