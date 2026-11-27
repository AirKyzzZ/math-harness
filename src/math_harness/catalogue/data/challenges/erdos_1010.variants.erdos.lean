import Mathlib

open SimpleGraph

namespace Erdos1010

open scoped Classical in
theorem erdos_1010.variants.erdos :
    ∃ c : ℝ, 0 < c ∧ ∀ n t : ℕ, t < c * n → ∀ G : SimpleGraph (Fin n), G.edgeFinset.card = n ^ 2 / 4 + t → t * (n / 2) ≤ (G.cliqueFinset 3).card := by
  sorry

end Erdos1010
