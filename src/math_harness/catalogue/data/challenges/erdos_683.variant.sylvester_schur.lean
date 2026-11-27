import Mathlib

namespace Erdos683

open Filter Real Erdos961

def P (n k : ℕ) : ℕ := (n.choose k).primeFactors.sup id

theorem erdos_683.variant.sylvester_schur :
    ∀ n k : ℕ, 0 < k ∧ k ≤ n / 2 → P n k > k := by
  sorry

-- TODO: Erdos 683 and 961 are equivalent.

end Erdos683
