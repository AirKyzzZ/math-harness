import Mathlib

namespace Erdos1048

open Polynomial Erdos1043

def openLevelSet (f : Polynomial ℂ) : Set ℂ :=
  {z : ℂ | ‖f.eval z‖ < 1}

theorem erdos_1048_neg :
    ¬ (¬ ∀ (r : ℝ) (f : ℂ[X]), 0 < r → r < 2 → f.Monic → f.degree ≥ 1 → (∀ z ∈ f.roots, ‖z‖ ≤ r) → ∃ z ∈ openLevelSet f, ENNReal.ofReal (2 - r) < Metric.ediam (connectedComponentIn (openLevelSet f) z)) := by
  sorry

end Erdos1048
