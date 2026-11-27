import Mathlib

namespace Erdos1048

open Polynomial Erdos1043

def openLevelSet (f : Polynomial ℂ) : Set ℂ :=
  {z : ℂ | ‖f.eval z‖ < 1}

theorem erdos_1048.variants.pommerenke_diam_tendsto_zero (r : ℝ) (hr : 1 < r) (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ n : ℕ in Filter.atTop, ∀ f : ℂ[X], f = (X : ℂ[X]) ^ n - C ((r : ℂ) ^ n) → ∀ z ∈ levelSet f, Metric.ediam (connectedComponentIn (levelSet f) z) < ENNReal.ofReal ε := by
  sorry

end Erdos1048
