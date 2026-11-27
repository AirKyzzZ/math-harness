import Mathlib

open SimpleGraph

namespace Erdos557

theorem erdos_557.variants.tight_odd (k n : ℕ) (hk : 0 < k) (hke : Even k) (hn : 2 ≤ n) (hno : Odd n) (T : SimpleGraph (Fin n)) (hT : T.IsTree) :
    multicolourGraphRamsey k T ≤ k * (n - 2) + 1 := by
  sorry

end Erdos557
