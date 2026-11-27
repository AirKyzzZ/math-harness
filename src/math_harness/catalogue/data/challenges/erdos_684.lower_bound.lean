import Mathlib

namespace Erdos684

open Filter Real

def smallPrimePart (n k : ℕ) : ℕ :=
  ∏ p ∈ Nat.primesLE k, p ^ ((n.choose k).factorization p)

theorem smallPrimePart_zero (n : ℕ) : smallPrimePart n 0 = 1 := by
  simp [smallPrimePart]

theorem erdos_684.lower_bound :
    ∃ᶠ n : ℕ in atTop, 1 < n ∧ ∀ k : ℕ, (k : ℝ) ≤ log (n : ℝ) / 8 → smallPrimePart n k = 1 := by
  sorry

end Erdos684
