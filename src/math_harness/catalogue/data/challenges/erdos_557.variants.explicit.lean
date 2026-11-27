import Mathlib

open SimpleGraph

namespace Erdos557

theorem erdos_557.variants.explicit (k n : ℕ) (T : SimpleGraph (Fin n)) (hT : T.IsTree) :
    multicolourGraphRamsey k T ≤ k * (n - 2) + 3 := by
  sorry

end Erdos557
