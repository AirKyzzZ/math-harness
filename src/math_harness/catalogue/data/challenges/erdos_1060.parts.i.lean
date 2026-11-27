import Mathlib

open Asymptotics Finset Filter Real

open scoped ArithmeticFunction.sigma

namespace Erdos1060

theorem erdos_1060.parts.i :
    ∃ h : ℕ → ℝ, h =o[atTop] (fun n ↦ 1 / log (log n)) ∧ ∀ᶠ n in atTop, #{k ≤ n | k * σ 1 k = n} ≤ (n : ℝ) ^ h n := by
  sorry

end Erdos1060
