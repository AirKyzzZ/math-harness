import Mathlib

open Filter Real SimpleGraph

namespace Erdos803

open scoped Classical in
theorem erdos_803.variants.alon :
    ∃ C : ℝ, ∀ D : ℝ, 1 < D → ∀ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Fin n), (n : ℝ) * log n ≤ G.edgeSet.ncard ∧ ∀ H : G.Subgraph, IsBalanced H.coe D → (H.edgeSet.ncard : ℝ) ≤ C * (H.verts.ncard * √(log H.verts.ncard) + log D) := by
  sorry

end Erdos803
