import Mathlib

namespace Erdos500

open Filter Asymptotics

open scoped Topology

theorem erdos_500.variants.upper_bound (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ n : ℕ in atTop, (Hypergraph.cliqueExtremalNumber n 3 4 : ℝ) ≤ (0.561666 + ε) * (n.choose 3 : ℝ) := by
  sorry

end Erdos500
