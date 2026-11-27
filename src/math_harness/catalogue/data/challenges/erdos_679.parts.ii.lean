import Mathlib

open Filter Real

namespace Erdos679

theorem erdos_679.parts.ii (C : ℝ) (K : ℕ) :
    ∀ᶠ n : ℕ in atTop, ∃ k < n, K < k ∧ log (k : ℝ) / log (log k) + C ≤ (ArithmeticFunction.cardDistinctFactors (n - k) : ℝ) := by
  sorry

end Erdos679
