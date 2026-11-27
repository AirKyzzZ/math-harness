import Mathlib

open Real

open scoped Nat Topology

namespace Erdos728

theorem erdos_728 :
    ∀ᶠ ε : ℝ in 𝓝[>] 0, ∀ C > (0 : ℝ), ∀ C' > C, ∃ a b n : ℕ, 0 < n ∧ ε * n < a ∧ ε * n < b ∧ a ! * b ! ∣ n ! * (a + b - n)! ∧ a + b > n + C * log n ∧ a + b < n + C' * log n := by
  sorry

-- TODO(firsching): Use Legendre's formula to test divisibility in terms of p-adic valuations.

end Erdos728
