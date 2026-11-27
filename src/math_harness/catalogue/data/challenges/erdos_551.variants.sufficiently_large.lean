import Mathlib

open Filter

namespace Erdos551

theorem erdos_551.variants.sufficiently_large :
    ∀ᶠ n : ℕ in atTop, ∀ k : ℕ, n ≤ k → SimpleGraph.graphRamsey (SimpleGraph.cycleGraph k) (SimpleGraph.completeGraph (Fin n)) = (k - 1) * (n - 1) + 1 := by
  sorry

end Erdos551
