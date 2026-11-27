import Mathlib

open Cardinal

namespace Erdos75

theorem erdos_75_neg :
    ¬ (∃ (V : Type) (G : SimpleGraph V), G.chromaticCardinal = ℵ_ 1 ∧ #V = ℵ_ 1 ∧ ∀ ε > (0 : ℝ), ∀ᶠ (n : ℕ) in Filter.atTop, ∀ (H : G.Subgraph), H.verts.ncard = n → ∃ (I : Finset V), (I : Set V) ⊆ H.verts ∧ G.IsIndepSet (I : Set V) ∧ (I.card : ℝ) > (n : ℝ) ^ (1 - ε)) := by
  sorry

end Erdos75
