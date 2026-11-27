import Mathlib

namespace Erdos762

theorem erdos_762.variants.bounded_clique_number (n : ℕ) (hn : 2 < n) :
    ∃ f : ℕ, ∀ (V : Type*) [Fintype V] (G : SimpleGraph V), G.CliqueFree n → G.chromaticNumber ≤ G.cochromaticNumber + f := by
  sorry

end Erdos762
