import Mathlib

namespace Erdos226

def PreservesRationality (f : ℝ → ℝ) : Prop :=
  ∀ x : ℝ, x ∈ Set.range ((↑) : ℚ → ℝ) ↔ f x ∈ Set.range ((↑) : ℚ → ℝ)

theorem erdos_226 :
    ∃ F : ℂ → ℂ, Differentiable ℂ F ∧ (∀ x : ℝ, (F x).im = 0) ∧ (∀ g : AffineMap ℝ ℝ ℝ, (fun x : ℝ => (F x).re) ≠ g) ∧ PreservesRationality (fun x : ℝ => (F x).re) := by
  sorry

end Erdos226
