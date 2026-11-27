import Mathlib

namespace Erdos1043

open MeasureTheory Polynomial

def levelSet (f : Polynomial ℂ) : Set ℂ :=
  {z : ℂ | ‖f.eval z‖ ≤ 1}

theorem erdos_1043.variants.weak :
    ∀ (f : ℂ[X]), f.Monic → f.degree ≥ 1 → ∃ (u : ℂ), ‖u‖ = 1 ∧ volume ((ℝ ∙ u).orthogonalProjectionOnto '' levelSet f) ≤ 3.3 := by
  sorry

end Erdos1043
