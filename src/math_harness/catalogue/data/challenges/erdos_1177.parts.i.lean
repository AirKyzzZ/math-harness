import Mathlib

namespace Erdos1177

open Cardinal Filter Asymptotics

theorem erdos_1177.parts.i :
    ∀ (W : Type) [Fintype W] (G : UniformHypergraph W 3), G.HasAvoidingChromaticCardinal ℵ₁ → ∃ (V : Type) (_ : DecidableEq V) (X : UniformHypergraph V 3), X.chromaticCardinal = ℵ₁ ∧ ¬ G.Appears X ∧ Cardinal.mk V ≤ (2 : Cardinal) ^ ((2 : Cardinal) ^ ℵ₀) := by
  sorry

end Erdos1177
