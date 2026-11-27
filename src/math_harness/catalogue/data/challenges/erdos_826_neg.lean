import Mathlib

open scoped ArithmeticFunction.sigma

namespace Erdos826

theorem erdos_826_neg :
    ¬ (∃ C > (0 : ℝ), { n | ∀ k ≥ 1, σ 0 (n + k) ≤ C * k }.Infinite) := by
  sorry

end Erdos826
