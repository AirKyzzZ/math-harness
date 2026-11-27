import Mathlib

namespace Erdos694

open Filter Topology Real

theorem erdos_694.variants.inf_unique (h : ∃ n > 0, ∃! m, Nat.totient m = n) :
    { n | ∃! m, Nat.totient m = n }.Infinite := by
  sorry

end Erdos694
