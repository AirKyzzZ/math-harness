import Mathlib

open Finset Filter SimpleGraph

namespace Erdos1077

open scoped Classical in
theorem erdos_1077_neg :
    ¬ (¬ ∀ ε > (0 : ℝ), ε < 1 → ∀ α > (0 : ℝ), α < 1 → ∀ᶠ D in atTop, ∀ᶠ n in atTop, ∀ G : SimpleGraph (Fin n), G.edgeSet.ncard > (n : ℝ) ^ (1 + α) → ∃ (H : Subgraph G), letI m := H.verts.ncard IsBalanced H.coe D ∧ m > (n : ℝ) ^ (1 - α) ∧ H.edgeSet.ncard > ε * m ^ (1 + α)) := by
  sorry

end Erdos1077
