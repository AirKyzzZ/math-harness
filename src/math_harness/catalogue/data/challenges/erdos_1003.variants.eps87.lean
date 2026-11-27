import Mathlib

namespace Erdos1003

open scoped Nat

open Filter

theorem erdos_1003.variants.eps87 :
    ∀ᶠ x in atTop, {(n : ℕ) | (n ≤ x) ∧ φ n = φ (n + 1)}.ncard ≤ x / Real.exp ((x.log) ^ ((1 : ℝ) / 3)) := by
  sorry

end Erdos1003
