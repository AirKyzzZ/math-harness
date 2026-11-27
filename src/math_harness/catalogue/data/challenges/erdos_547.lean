import Mathlib

open Filter

namespace Erdos547

theorem erdos_547 :
    ∀ (n : ℕ) (hn : 2 ≤ n) (T : SimpleGraph (Fin n)), T.IsTree → SimpleGraph.diagonalGraphRamsey T ≤ 2 * n - 2 := by
  sorry

end Erdos547
