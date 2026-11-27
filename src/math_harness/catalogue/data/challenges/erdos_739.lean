import Mathlib

open Cardinal SimpleGraph

universe u

namespace Erdos739

theorem erdos_739 :
    ∀ (V : Type u) (G : SimpleGraph V) (n : Cardinal.{u}), ℵ₀ ≤ n → n < G.chromaticCardinal → ∃ H : G.Subgraph, H.coe.chromaticCardinal = n := by
  sorry

end Erdos739
