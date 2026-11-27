import Mathlib

namespace Erdos1094

open scoped Nat

theorem erdos_1094 :
    {(n, k) : ℕ × ℕ | 0 < k ∧ 2 * k ≤ n ∧ (n.choose k).minFac > max (n / k) k}.Finite := by
  sorry

end Erdos1094
