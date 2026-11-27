import Mathlib

open Cardinal SimpleGraph

universe u

namespace Erdos739

theorem erdos_739.variants.induced :
    (∀ (V : Type u) (G : SimpleGraph V) (n : Cardinal.{u}), ℵ₀ ≤ n → n < G.chromaticCardinal → ∃ s : Set V, (G.induce s).chromaticCardinal = n) → ∀ κ μ : Cardinal.{u}, κ < μ → (2 : Cardinal.{u}) ^ κ < 2 ^ μ := by
  sorry

end Erdos739
