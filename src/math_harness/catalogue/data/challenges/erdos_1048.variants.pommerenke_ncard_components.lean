import Mathlib

namespace Erdos1048

open Polynomial Erdos1043

def openLevelSet (f : Polynomial ℂ) : Set ℂ :=
  {z : ℂ | ‖f.eval z‖ < 1}

theorem erdos_1048.variants.pommerenke_ncard_components (r : ℝ) (hr : 1 < r) (n : ℕ) (hn : 1 ≤ n) (f : ℂ[X]) (hf : f = (X : ℂ[X]) ^ n - C ((r : ℂ) ^ n)) :
    {C : Set ℂ | ∃ z ∈ levelSet f, C = connectedComponentIn (levelSet f) z}.ncard = n := by
  sorry

end Erdos1048
