import Mathlib

open SimpleGraph

namespace Erdos581

noncomputable def f (m : ℕ) : ℕ :=
  sSup {k | ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.CliqueFree 3 →
    G.edgeSet.ncard = m → ∃ H ≤ G, H.IsBipartite ∧ k ≤ H.edgeSet.ncard}

theorem erdos_581 :
    ∃ c₁ c₂ : ℝ, 0 < c₁ ∧ 0 < c₂ ∧ ∀ m : ℕ, (m : ℝ) / 2 + c₁ * (m : ℝ) ^ (4 / 5 : ℝ) ≤ f m ∧ (f m : ℝ) ≤ (m : ℝ) / 2 + c₂ * (m : ℝ) ^ (4 / 5 : ℝ) := by
  sorry

end Erdos581
