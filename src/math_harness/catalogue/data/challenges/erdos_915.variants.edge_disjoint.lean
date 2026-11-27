import Mathlib

open SimpleGraph

namespace Erdos915

theorem erdos_915.variants.edge_disjoint :
    ∀ m n : ℕ, 2 ≤ m → 1 ≤ n → ∀ (V : Type) [Fintype V] (G : SimpleGraph V), Fintype.card V = 1 + n * (m - 1) → G.edgeSet.ncard = 1 + n * m.choose 2 → ∃ u v : V, u ≠ v ∧ ∃ P : Finset (G.Walk u v), P.card = m ∧ (∀ p ∈ P, p.IsPath) ∧ (P : Set (G.Walk u v)).Pairwise fun p q => List.Disjoint p.edges q.edges := by
  sorry

end Erdos915
