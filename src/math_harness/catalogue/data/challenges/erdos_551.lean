import Mathlib

open Filter

namespace Erdos551

theorem erdos_551 :
    ∀ (k n : ℕ), 3 ≤ n → n ≤ k → ¬(n = 3 ∧ k = 3) → SimpleGraph.graphRamsey (SimpleGraph.cycleGraph k) (SimpleGraph.completeGraph (Fin n)) = (k - 1) * (n - 1) + 1 := by
  sorry

end Erdos551
