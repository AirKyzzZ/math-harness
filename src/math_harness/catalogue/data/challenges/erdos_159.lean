import Mathlib

namespace Erdos159

theorem erdos_159 :
    ∃ (c : ℝ) (_ : 0 < c) (C : ℝ), ∀ (n : ℕ), 1 ≤ n → (SimpleGraph.graphRamsey (SimpleGraph.cycleGraph 4) (SimpleGraph.completeGraph (Fin n)) : ℝ) ≤ C * (n : ℝ) ^ (2 - c) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos159
