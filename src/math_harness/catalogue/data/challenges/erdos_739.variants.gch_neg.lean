import Mathlib

open Cardinal SimpleGraph

universe u

namespace Erdos739

theorem erdos_739.variants.gch_neg :
    ¬ ((∀ c : Cardinal.{u}, ℵ₀ ≤ c → 2 ^ c = Order.succ c) → ∀ (V : Type u) (G : SimpleGraph V) (n : Cardinal.{u}), ℵ₀ ≤ n → n < G.chromaticCardinal → ∃ H : G.Subgraph, H.coe.chromaticCardinal = n) := by
  sorry

end Erdos739
