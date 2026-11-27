import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos127

noncomputable def f (m : ℕ) : ℕ :=
  sSup {k : ℕ | ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.edgeSet.ncard = m →
    ∃ H : SimpleGraph V, H ≤ G ∧ H.IsBipartite ∧
      (m : ℝ) / 2 + (√(8 * m + 1) - 1) / 8 + k ≤ H.edgeSet.ncard}

theorem erdos_127.variants.edwards {V : Type*} [Finite V] (G : SimpleGraph V) :
    ∃ H : SimpleGraph V, H ≤ G ∧ H.IsBipartite ∧ (G.edgeSet.ncard : ℝ) / 2 + (√(8 * G.edgeSet.ncard + 1) - 1) / 8 ≤ H.edgeSet.ncard := by
  sorry

end Erdos127
