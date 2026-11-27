import Mathlib

open SimpleGraph

namespace Erdos915

theorem erdos_915_neg :
    ¬ (¬ ∀ m n : ℕ, 2 ≤ m → 1 ≤ n → ∀ (V : Type) [Fintype V] (G : SimpleGraph V), Fintype.card V = 1 + n * (m - 1) → G.edgeSet.ncard = 1 + n * m.choose 2 → ∃ u v : V, u ≠ v ∧ ∃ P : Finset (G.Walk u v), P.card = m ∧ (∀ p ∈ P, p.IsPath) ∧ (P : Set (G.Walk u v)).Pairwise InternallyDisjoint) := by
  sorry

end Erdos915
