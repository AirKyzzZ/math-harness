import Mathlib

namespace Erdos762

theorem erdos_762 :
    ¬ ∀ (V : Type*) [Fintype V] (G : SimpleGraph V), G.CliqueFree 5 → 4 ≤ G.cochromaticNumber → G.chromaticNumber ≤ G.cochromaticNumber + 2 := by
  sorry

end Erdos762
