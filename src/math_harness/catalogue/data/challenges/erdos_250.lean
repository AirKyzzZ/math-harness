import Mathlib

open scoped ArithmeticFunction.sigma

namespace Erdos250

theorem erdos_250 :
    (∀ x, HasSum (fun (n : ℕ) => σ 1 n / (2 : ℝ) ^ n) x → Irrational x) := by
  sorry

end Erdos250
