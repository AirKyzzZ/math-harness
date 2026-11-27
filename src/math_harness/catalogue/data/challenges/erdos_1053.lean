import Mathlib

open ArithmeticFunction Filter

open scoped ArithmeticFunction.sigma

namespace Erdos1053

theorem erdos_1053 :
    (fun n : ℕ ↦ (σ 1 n : ℝ) / (n : ℝ)) =o[atTop ⊓ 𝓟 {n : ℕ | ∃ k, Nat.IsPerfectFor n 1 k}] (fun n : ℕ ↦ Real.log (Real.log (n : ℝ))) := by
  sorry

end Erdos1053
