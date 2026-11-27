import Mathlib

namespace Erdos181

open SimpleGraph

theorem erdos_181 :
    ∃ C > (0 : ℝ), ∀ n : ℕ, (diagonalGraphRamsey (hypercube n) : ℝ) ≤ C * 2 ^ n := by
  sorry

-- TODO: Add variants of the problem.

end Erdos181
