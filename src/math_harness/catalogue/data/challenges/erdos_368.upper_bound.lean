import Mathlib

namespace Erdos368

open Filter

def F (n : ℕ) : ℕ := (n * (n + 1)).maxPrimeFac

theorem erdos_368.upper_bound :
    ∀ ε : ℝ, 0 < ε → ∃ᶠ n : ℕ in atTop, (F n : ℝ) < Real.log n ^ (2 + ε) := by
  sorry

example : F 1 = 2 := by decide +kernel

example : F 8 = 3 := by decide +kernel

example : F 80 = 5 := by decide +kernel

example : F 4374 = 7 := by decide +kernel

end Erdos368
