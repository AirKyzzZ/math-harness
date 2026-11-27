import Mathlib

namespace Erdos683

open Filter Real Erdos961

def P (n k : ℕ) : ℕ := (n.choose k).primeFactors.sup id

theorem erdos_683.variant.exp_sqrt :
    ∃ c > 0, ∀ n k : ℕ, 0 < k ∧ k ≤ n / 2 → (P n k : ℝ) > min (↑(n - k + 1) : ℝ) (Real.exp (c * Real.sqrt k)) := by
  sorry

-- TODO: Erdos 683 and 961 are equivalent.

end Erdos683
