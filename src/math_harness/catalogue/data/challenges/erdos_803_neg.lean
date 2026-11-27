import Mathlib

open Filter Real SimpleGraph

namespace Erdos803

open scoped Classical in
theorem erdos_803_neg :
    ¬ (¬ ∃ (D c : ℝ), 0 < c ∧ ∀ m ≥ 1, ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), (n : ℝ) * log n ≤ G.edgeSet.ncard → ∃ H : G.Subgraph, H.verts.ncard = m ∧ IsBalanced H.coe D ∧ c * m * log m ≤ H.edgeSet.ncard) := by
  sorry

end Erdos803
