import Mathlib

namespace Erdos907

theorem erdos_907 :
    ∀ f : ℝ → ℝ, (∀ h : ℝ, 0 < h → Continuous fun x => f (x + h) - f x) → ∃ g a : ℝ → ℝ, Continuous g ∧ (∀ x y, a (x + y) = a x + a y) ∧ f = g + a := by
  sorry

end Erdos907
