import Mathlib

open Cardinal SimpleGraph

namespace Erdos1068

theorem erdos_1068_neg :
    ¬ (∀ (V : Type) (G : SimpleGraph V), G.chromaticCardinal = ℵ_ 1 → ∃ s : Set V, s.Countable ∧ InfinitelyConnected (G.induce s)) := by
  sorry

end Erdos1068
