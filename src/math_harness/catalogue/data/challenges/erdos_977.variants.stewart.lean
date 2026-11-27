import Mathlib

open Filter

namespace Erdos977

theorem erdos_977.variants.stewart :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, c * (n : ℝ) ^ (1 + 1 / (104 * Real.log (Real.log n))) ≤ Nat.maxPrimeFac (2 ^ n - 1) := by
  sorry

end Erdos977
