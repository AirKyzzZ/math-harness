import Mathlib

open Cardinal SimpleGraph

universe u

namespace Erdos739

theorem erdos_739.variants.aleph_zero :
    ∀ (V : Type u) (G : SimpleGraph V), ℵ₀ < G.chromaticCardinal → ∃ H : G.Subgraph, H.coe.chromaticCardinal = ℵ₀ := by
  sorry

end Erdos739
