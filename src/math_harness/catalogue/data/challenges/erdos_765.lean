import Mathlib

open Filter Asymptotics

namespace Erdos765

theorem erdos_765 :
    (fun n : ℕ ↦ (SimpleGraph.extremalNumber n (SimpleGraph.cycleGraph 4) : ℝ)) ~[atTop] fun n : ℕ ↦ (n : ℝ) ^ (3 / 2 : ℝ) / 2 := by
  sorry

end Erdos765
