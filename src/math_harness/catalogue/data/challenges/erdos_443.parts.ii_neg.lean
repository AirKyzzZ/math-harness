import Mathlib

namespace Erdos443

def A (m : ℕ) : Finset ℕ := (Finset.Icc 1 (m / 2)).image fun k => k * (m - k)

theorem erdos_443.parts.ii_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ∃ n₀ : ℕ, ∀ m n : ℕ, n₀ < n → n < m → ((A n ∩ A m).card : ℝ) < ((m : ℝ) * n) ^ ε) := by
  sorry

end Erdos443
