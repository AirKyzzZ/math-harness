import Mathlib

namespace Erdos251

theorem erdos_251_neg :
    ¬ (Irrational (∑' n : ℕ, (Nat.nth Nat.Prime n) / (2 ^ n))) := by
  sorry

end Erdos251
