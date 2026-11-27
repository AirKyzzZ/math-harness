import Mathlib

namespace Erdos680

open Real

theorem erdos_680.parts.ii_neg :
    ¬ (∀ ε > 0, ∃ C > 0, ¬ ∀ᶠ (n : ℕ) in Filter.atTop, ∃ k ≠ 0, Nat.minFac (n + k) > exp ((1 + ε) * √k) + C) := by
  sorry

end Erdos680
