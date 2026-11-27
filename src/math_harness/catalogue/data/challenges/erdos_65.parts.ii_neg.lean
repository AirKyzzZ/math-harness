import Mathlib

namespace Erdos65

theorem erdos_65.parts.ii_neg :
    ¬ (∀ (k : ℝ) (hk : 0 < k), ∀ (n : ℕ) (V : Type) [Fintype V] (G : SimpleGraph V), 0 < n → Fintype.card V = n → (G.edgeSet.ncard : ℝ) = k * n → ∀ (A B : Type) [Fintype A] [Fintype B], Fintype.card (A ⊕ B) = n → ((completeBipartiteGraph A B).edgeSet.ncard : ℝ) = k * n → (∑ᶠ a ∈ (completeBipartiteGraph A B).cycleLengths, (1 : ℝ) / a) ≤ (∑ᶠ a ∈ G.cycleLengths, (1 : ℝ) / a)) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos65
