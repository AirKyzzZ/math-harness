import Mathlib

open Filter

namespace Erdos110

theorem erdos_110_neg :
    ¬ (¬ ∃ F : ℕ → ℕ, ∀ (V : Type 1) (G : SimpleGraph V), Erdos737.ChromaticNumberAlephOne G → ∀ᶠ n : ℕ in atTop, ∃ H : G.Subgraph, H.verts.Finite ∧ H.verts.ncard ≤ F n ∧ H.coe.chromaticNumber = (n : ℕ∞)) := by
  sorry

end Erdos110
