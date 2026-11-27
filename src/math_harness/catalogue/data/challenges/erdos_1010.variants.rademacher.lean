import Mathlib

open SimpleGraph

namespace Erdos1010

open scoped Classical in
theorem erdos_1010.variants.rademacher :
    ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), G.edgeFinset.card = n ^ 2 / 4 + 1 → n / 2 ≤ (G.cliqueFinset 3).card := by
  sorry

end Erdos1010
