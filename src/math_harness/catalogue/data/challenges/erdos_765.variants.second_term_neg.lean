import Mathlib

open Filter Asymptotics

namespace Erdos765

theorem erdos_765.variants.second_term_neg :
    ¬ (¬ (fun n : ℕ ↦ (SimpleGraph.extremalNumber n (SimpleGraph.cycleGraph 4) : ℝ) - (n : ℝ) ^ (3 / 2 : ℝ) / 2 - (n : ℝ) / 4) =O[atTop] fun n : ℕ ↦ (n : ℝ) ^ (1 / 2 : ℝ)) := by
  sorry

end Erdos765
