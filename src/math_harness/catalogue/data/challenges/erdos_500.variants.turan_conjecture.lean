import Mathlib

namespace Erdos500

open Filter Asymptotics

open scoped Topology

theorem erdos_500.variants.turan_conjecture :
    (fun n ↦ (Hypergraph.cliqueExtremalNumber n 3 4 : ℝ)) ~[atTop] fun n ↦ 5 / 9 * (n.choose 3 : ℝ) := by
  sorry

end Erdos500
