import Mathlib

open Filter

namespace Erdos544

theorem erdos_544.parts.ii :
    (fun k : ℕ ↦ (SimpleGraph.classicalRamsey 3 (k + 1) : ℝ) - (SimpleGraph.classicalRamsey 3 k : ℝ)) =o[atTop] (fun k : ℕ ↦ (k : ℝ)) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos544
