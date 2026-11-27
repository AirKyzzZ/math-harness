import Mathlib

namespace Erdos552

theorem erdos_552.parts.ii :
    ∀ (c : ℝ), 0 < c → Set.Infinite {n : ℕ | (SimpleGraph.graphRamsey (SimpleGraph.cycleGraph 4) (completeBipartiteGraph (Fin 1) (Fin n)) : ℝ) ≤ (n : ℝ) + Real.sqrt n - c} := by
  sorry

-- TODO: Add variants of the problem.

end Erdos552
