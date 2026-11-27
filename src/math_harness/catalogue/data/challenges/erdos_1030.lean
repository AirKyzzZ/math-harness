import Mathlib

open Filter

namespace Erdos1030

theorem erdos_1030 :
    ∃ c > (0 : ℝ), ∃ L : ℝ, Tendsto (fun k : ℕ ↦ (SimpleGraph.classicalRamsey (k + 1) k : ℝ) / (SimpleGraph.classicalRamsey k k : ℝ)) atTop (nhds L) ∧ L > 1 + c := by
  sorry

-- TODO: Add variants of the problem.

end Erdos1030
