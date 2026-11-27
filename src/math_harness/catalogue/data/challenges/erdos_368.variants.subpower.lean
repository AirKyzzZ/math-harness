import Mathlib

namespace Erdos368

open Filter

def F (n : ℕ) : ℕ := (n * (n + 1)).maxPrimeFac

theorem erdos_368.variants.subpower :
    ∀ δ : ℝ, 0 < δ → ∃ᶠ n : ℕ in atTop, (F n : ℝ) ≤ (n : ℝ) ^ δ := by
  sorry

example : F 1 = 2 := by decide +kernel

example : F 8 = 3 := by decide +kernel

example : F 80 = 5 := by decide +kernel

example : F 4374 = 7 := by decide +kernel

end Erdos368
