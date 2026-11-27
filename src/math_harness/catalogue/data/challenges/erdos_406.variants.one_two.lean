import Mathlib

namespace Erdos406

theorem erdos_406.variants.one_two :
    IsGreatest { n | n.isPowerOfTwo ∧ Nat.digits 3 n ⊆ [1, 2] } (2 ^ 15) := by
  sorry

end Erdos406
