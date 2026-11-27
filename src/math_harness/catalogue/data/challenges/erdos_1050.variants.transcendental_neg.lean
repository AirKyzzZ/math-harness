import Mathlib

namespace Erdos1050

theorem erdos_1050.variants.transcendental_neg :
    ¬ (∀ t : ℤ, t ≠ 0 → (∀ n : ℕ, 1 ≤ n → t ≠ -(2 : ℤ) ^ n) → Transcendental ℚ (∑' n : ℕ, (1 : ℝ) / ((2 : ℝ) ^ (n + 1) + (t : ℝ)))) := by
  sorry

end Erdos1050
