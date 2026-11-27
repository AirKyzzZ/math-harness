import Mathlib

namespace Erdos1050

theorem erdos_1050.variants.borwein (q : ℤ) (hq : 2 ≤ q) (r : ℚ) (hr : r ≠ 0) (hne : ∀ n : ℕ, 1 ≤ n → r ≠ -((q : ℚ) ^ n)) :
    Irrational (∑' n : ℕ, (1 : ℝ) / ((q : ℝ) ^ (n + 1) + (r : ℝ))) := by
  sorry

end Erdos1050
