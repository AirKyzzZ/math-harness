import Mathlib

open scoped Nat ArithmeticFunction.sigma

namespace Erdos252

noncomputable def erdos_252_sum (k : ℕ) : ℝ := ∑' n, σ k n / (n ! : ℝ)

theorem erdos_252.variants.schinzel (hs : ∀ (fs : Finset (Polynomial ℤ)), (∀ f ∈ fs, BunyakovskyCondition f) → SchinzelCondition fs → Infinite ↑{n | ∀ f ∈ fs, Prime (Polynomial.eval (↑n) f).natAbs}) :
    ∀ k, Irrational (erdos_252_sum k) := by
  sorry

end Erdos252
