import Mathlib

namespace Erdos552

theorem erdos_552.variants.succ_le_add_two (n : ℕ) (hn : 1 ≤ n) :
    SimpleGraph.graphRamsey (SimpleGraph.cycleGraph 4) (completeBipartiteGraph (Fin 1) (Fin (n + 1))) ≤ SimpleGraph.graphRamsey (SimpleGraph.cycleGraph 4) (completeBipartiteGraph (Fin 1) (Fin n)) + 2 := by
  sorry

-- TODO: Add variants of the problem.

end Erdos552
