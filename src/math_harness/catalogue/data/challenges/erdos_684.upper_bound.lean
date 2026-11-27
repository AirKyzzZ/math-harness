import Mathlib

namespace Erdos684

open Filter Real

def smallPrimePart (n k : ℕ) : ℕ :=
  ∏ p ∈ Nat.primesLE k, p ^ ((n.choose k).factorization p)

theorem smallPrimePart_zero (n : ℕ) : smallPrimePart n 0 = 1 := by
  simp [smallPrimePart]

theorem erdos_684.upper_bound :
    ∀ᶠ n : ℕ in atTop, ∃ k ≤ n, (k : ℝ) ≤ 514 * (log (n : ℝ)) ^ 2 ∧ n ^ 2 < smallPrimePart n k := by
  sorry

end Erdos684
