import Mathlib

namespace Erdos73

theorem erdos_73_neg :
    ¬ (∀ (k : ℕ), ∃ (C : ℕ), ∀ (V : Type) [Fintype V] (G : SimpleGraph V), (∀ (S : Finset V), ∃ (I : Finset V), I ⊆ S ∧ (G.induce (I : Set V)).edgeSet = ∅ ∧ (I.card : ℝ) ≥ (S.card - k : ℝ) / 2) → ∃ (D : Finset V), D.card ≤ C ∧ (G.induce (D : Set V)ᶜ).Colorable 2) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos73
