import Mathlib

namespace Erdos712

open Filter Asymptotics

open scoped Topology

theorem erdos_712.variants.graph_case (k : ℕ) (hk : 2 ≤ k) :
    Tendsto (fun n : ℕ ↦ (Hypergraph.cliqueExtremalNumber n 2 k : ℝ) / n.choose 2) atTop (𝓝 (1 - 1 / ((k : ℝ) - 1))) := by
  sorry

end Erdos712
