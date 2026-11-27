import Mathlib

open SimpleGraph

namespace Erdos557

theorem erdos_557.variants.tight (k n : ℕ) (hn : 2 ≤ n) (T : SimpleGraph (Fin n)) (hT : T.IsTree) :
    multicolourGraphRamsey k T ≤ k * (n - 2) + 2 := by
  sorry

end Erdos557
