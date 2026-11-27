import Mathlib

namespace Erdos476

theorem erdos_476 :
    ∀ p : ℕ, Fact p.Prime → ∀ A : Finset (ZMod p), A.restrictedSumset.card ≥ min (2 * A.card - 3) p := by
  sorry

end Erdos476
