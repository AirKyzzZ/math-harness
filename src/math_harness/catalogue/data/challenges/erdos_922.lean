import Mathlib

open SimpleGraph

namespace Erdos922

theorem erdos_922 :
    ∀ (k : ℕ) (V : Type) [Fintype V] (G : SimpleGraph V), (∀ S : Finset V, ∃ I : Finset V, I ⊆ S ∧ (G.induce (I : Set V)).edgeSet = ∅ ∧ (I.card : ℝ) ≥ (S.card - k : ℝ) / 2) → G.chromaticNumber ≤ k + 2 := by
  sorry

end Erdos922
