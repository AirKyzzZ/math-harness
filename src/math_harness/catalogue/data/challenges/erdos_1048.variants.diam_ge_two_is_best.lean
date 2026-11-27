import Mathlib

namespace Erdos1048

open Polynomial Erdos1043

def openLevelSet (f : Polynomial ℂ) : Set ℂ :=
  {z : ℂ | ‖f.eval z‖ < 1}

theorem erdos_1048.variants.diam_ge_two_is_best (n : ℕ) (hn : 1 ≤ n) :
    Metric.ediam (connectedComponentIn (levelSet ((X : ℂ[X]) ^ n)) 0) = 2 := by
  sorry

end Erdos1048
