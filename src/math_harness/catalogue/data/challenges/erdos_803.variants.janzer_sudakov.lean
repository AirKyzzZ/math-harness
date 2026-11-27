import Mathlib

open Filter Real SimpleGraph

namespace Erdos803

open scoped Classical in
theorem erdos_803.variants.janzer_sudakov :
    ∃ D : ℝ, ∀ k : ℕ, ∃ c > 0, ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), (n : ℝ) * log n ≤ G.edgeSet.ncard → ∃ H : G.Subgraph, k ≤ H.verts.ncard ∧ IsBalanced H.coe D ∧ c * (√(log H.verts.ncard) / (log (log H.verts.ncard)) ^ (3 / 2 : ℝ)) * H.verts.ncard ≤ H.edgeSet.ncard := by
  sorry

end Erdos803
