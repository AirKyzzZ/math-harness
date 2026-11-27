import Mathlib

open SimpleGraph

namespace Erdos548

theorem erdos_548 (n k : ℕ) (hk : k + 1 ≤ n) (G : SimpleGraph (Fin n)) (H : ((k : ℚ) - 1) / 2 * n + 1 ≤ (G.edgeSet.ncard : ℚ)) (T : SimpleGraph (Fin (k + 1))) (hT : T.IsTree) :
    T.IsContained G := by
  sorry

end Erdos548
