import Mathlib

namespace Erdos500

open Filter Asymptotics

open scoped Topology

theorem erdos_500.variants.lower_bound (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ n : ℕ in atTop, (5 / 9 - ε) * (n.choose 3 : ℝ) ≤ Hypergraph.cliqueExtremalNumber n 3 4 := by
  sorry

end Erdos500
