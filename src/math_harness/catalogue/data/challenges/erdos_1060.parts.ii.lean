import Mathlib

open Asymptotics Finset Filter Real

open scoped ArithmeticFunction.sigma

namespace Erdos1060

theorem erdos_1060.parts.ii :
    ∃ (C : ℝ), (fun n ↦ (#{k ≤ n | k * σ 1 k = n} : ℝ)) =O[atTop] (fun n ↦ log n ^ C) := by
  sorry

end Erdos1060
