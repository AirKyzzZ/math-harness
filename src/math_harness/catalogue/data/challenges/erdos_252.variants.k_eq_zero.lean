import Mathlib

open scoped Nat ArithmeticFunction.sigma

namespace Erdos252

noncomputable def erdos_252_sum (k : ℕ) : ℝ := ∑' n, σ k n / (n ! : ℝ)

theorem erdos_252.variants.k_eq_zero :
    Irrational (erdos_252_sum 0) := by
  sorry

end Erdos252
