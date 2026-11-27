import Mathlib

namespace Erdos1177

open Cardinal Filter Asymptotics

theorem erdos_1177.parts.ii :
    ¬ ∀ (W U : Type) [Fintype W] [Fintype U] (G : UniformHypergraph W 3) (H : UniformHypergraph U 3), G.HasAvoidingChromaticCardinal ℵ₁ → H.HasAvoidingChromaticCardinal ℵ₁ → ∃ (V : Type) (_ : DecidableEq V) (X : UniformHypergraph V 3), X.chromaticCardinal = ℵ₁ ∧ ¬ G.Appears X ∧ ¬ H.Appears X := by
  sorry

end Erdos1177
