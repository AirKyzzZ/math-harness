import Mathlib

open scoped Nat ArithmeticFunction.sigma

namespace Erdos252

noncomputable def erdos_252_sum (k : ℕ) : ℝ := ∑' n, σ k n / (n ! : ℝ)

theorem erdos_252 :
    ∀ k ≥ 1, Irrational (erdos_252_sum k) := by
  sorry

end Erdos252
