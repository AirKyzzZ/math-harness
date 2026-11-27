import Mathlib

open Filter

namespace Erdos977

theorem erdos_977.variants.lai :
    ∀ C : ℝ, C < 1 + 9 * Real.log 2 → ∃ᶠ n : ℕ in atTop, C * n < Nat.maxPrimeFac (n.factorial + 1) := by
  sorry

end Erdos977
