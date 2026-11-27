import Mathlib

namespace Erdos368

open Filter

def F (n : ℕ) : ℕ := (n * (n + 1)).maxPrimeFac

theorem erdos_368.lower_bound :
    ∃ c : ℝ, 0 < c ∧ ∀ n : ℕ, 1 ≤ n → c * Real.log n ^ 2 ≤ (F n : ℝ) := by
  sorry

example : F 1 = 2 := by decide +kernel

example : F 8 = 3 := by decide +kernel

example : F 80 = 5 := by decide +kernel

example : F 4374 = 7 := by decide +kernel

end Erdos368
