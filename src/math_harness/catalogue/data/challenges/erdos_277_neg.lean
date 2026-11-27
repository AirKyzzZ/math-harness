import Mathlib

open scoped ArithmeticFunction.sigma

namespace Erdos277

theorem erdos_277_neg :
    ¬ (∀ c : ℝ, ∃ n : ℕ, (σ 1 n : ℝ) > c * n ∧ ∀ (m : StrictCoveringSystem ℤ), ∃ i, (n : ℤ) ∉ m.moduli i) := by
  sorry

end Erdos277
