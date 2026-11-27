import Mathlib

open Filter

namespace Erdos547

theorem erdos_547.variants.sufficiently_large :
    ∀ᶠ n : ℕ in atTop, ∀ T : SimpleGraph (Fin n), T.IsTree → SimpleGraph.diagonalGraphRamsey T ≤ 2 * n - 2 := by
  sorry

end Erdos547
