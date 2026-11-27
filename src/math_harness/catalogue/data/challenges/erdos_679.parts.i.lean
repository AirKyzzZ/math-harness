import Mathlib

open Filter Real

namespace Erdos679

theorem erdos_679.parts.i :
    ∀ ε : ℝ, 0 < ε → ∃ K : ℕ, ∃ᶠ n : ℕ in atTop, ∀ k : ℕ, K < k → k < n → (ArithmeticFunction.cardDistinctFactors (n - k) : ℝ) < (1 + ε) * log k / log (log k) := by
  sorry

end Erdos679
