import Mathlib

namespace Erdos1177

open Cardinal Filter Asymptotics

theorem erdos_1177.parts.iii :
    ∀ (W : Type) [Fintype W] (G : UniformHypergraph W 3) (κ μ : Cardinal), ℵ₀ < κ → ℵ₀ < μ → G.HasAvoidingChromaticCardinal κ → G.HasAvoidingChromaticCardinal μ := by
  sorry

end Erdos1177
