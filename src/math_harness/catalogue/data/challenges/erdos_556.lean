import Mathlib

open Filter

namespace Erdos556

open SimpleGraph

theorem erdos_556 (n : ℕ) (hn : 4 ≤ n) :
    multicolourRamsey (cycleGraph n) 3 ≤ 4 * n - 3 := by
  sorry

end Erdos556
