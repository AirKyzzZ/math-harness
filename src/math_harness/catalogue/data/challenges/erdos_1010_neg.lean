import Mathlib

open SimpleGraph

namespace Erdos1010

open scoped Classical in
theorem erdos_1010_neg :
    ¬ (∀ n t : ℕ, t < n / 2 → ∀ G : SimpleGraph (Fin n), G.edgeFinset.card = n ^ 2 / 4 + t → t * (n / 2) ≤ (G.cliqueFinset 3).card) := by
  sorry

end Erdos1010
