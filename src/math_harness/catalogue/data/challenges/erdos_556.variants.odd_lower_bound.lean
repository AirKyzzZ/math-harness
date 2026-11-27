import Mathlib

open Filter

namespace Erdos556

open SimpleGraph

theorem erdos_556.variants.odd_lower_bound (n : ℕ) (hn : 3 ≤ n) (hodd : Odd n) :
    4 * n - 3 ≤ multicolourRamsey (cycleGraph n) 3 := by
  sorry

end Erdos556
