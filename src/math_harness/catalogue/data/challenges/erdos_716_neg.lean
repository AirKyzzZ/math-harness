import Mathlib

namespace Erdos716

open Filter Asymptotics

theorem erdos_716_neg :
    ¬ ((fun n ↦ (Hypergraph.configurationExtremalNumber n 3 6 3 : ℝ)) =o[atTop] (fun n ↦ (n : ℝ) ^ 2)) := by
  sorry

end Erdos716
