import Mathlib

open Filter

namespace Erdos1029

theorem erdos_1029 :
    Tendsto (fun k : ℕ ↦ (SimpleGraph.diagonalRamsey k : ℝ) / ((k : ℝ) * (2 : ℝ) ^ ((k : ℝ) / 2))) atTop atTop := by
  sorry

-- TODO: Add variants of the problem.

end Erdos1029
