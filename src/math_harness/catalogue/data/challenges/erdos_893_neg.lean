import Mathlib

open Filter Finset

open scoped ArithmeticFunction.sigma

namespace Erdos893

def f (n : ℕ) : ℕ :=  ∑ k ∈ Finset.Icc 1 n, σ 0 (2^k - 1)

theorem erdos_893_neg :
    ¬ (Tendsto (fun n : ℕ => (f (2 * n) : ℝ) / (f n : ℝ)) atTop atTop) := by
  sorry

end Erdos893
