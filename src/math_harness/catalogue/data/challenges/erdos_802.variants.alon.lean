import Mathlib

open Real

namespace Erdos802

open scoped Classical in
theorem erdos_802.variants.alon :
    ∀ r : ℕ, ∃ c > (0 : ℝ), ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), (∀ v, (G.induce (G.neighborSet v)).Colorable (r - 2)) → c * (log G.averageDegree / G.averageDegree) * n ≤ G.indepNum := by
  sorry

end Erdos802
