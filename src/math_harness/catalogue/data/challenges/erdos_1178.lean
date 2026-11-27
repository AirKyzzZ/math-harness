import Mathlib

namespace Erdos1178

open Filter Asymptotics

theorem erdos_1178 :
    ∀ r e : ℕ, 3 ≤ r → 3 ≤ e → Hypergraph.sparseConfigurationThreshold r e = (((r - 2) * e + 3 : ℕ) : ℕ∞) := by
  sorry

end Erdos1178
