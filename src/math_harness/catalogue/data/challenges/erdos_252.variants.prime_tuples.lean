import Mathlib

open scoped Nat ArithmeticFunction.sigma

namespace Erdos252

noncomputable def erdos_252_sum (k : ℕ) : ℝ := ∑' n, σ k n / (n ! : ℝ)

theorem erdos_252.variants.prime_tuples {k : ℕ} (hk : 4 ≤ k) (hp : ∀ (a : Fin k → ℕ+) (b : Fin k → ℕ) (hab : ∀ p, p.Prime → ∃ n, ¬ p ∣ ∏ i, (a i * n + b i)), Set.Infinite {n | ∀ i : Fin k, (a i * n + b i).Prime} ) :
    Irrational (erdos_252_sum k) := by
  sorry

end Erdos252
