import Mathlib

namespace Erdos923

open SimpleGraph

theorem erdos_923 :
    ∀ (V : Type*) (n : ℕ), ∃ k : ℕ, ∀ G : SimpleGraph V, k ≤ G.chromaticNumber → ∃ H ≤ G, n ≤ H.chromaticNumber ∧ H.CliqueFree 3 := by
  sorry

end Erdos923
