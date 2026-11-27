import Mathlib

namespace Erdos1116

noncomputable def aPointCount (f : ℂ → ℂ) (r : ℝ) (a : ℂ) : ℕ :=
  ∑ᶠ z : ℂ,
    Int.toNat (MeromorphicOn.divisor (fun w ↦ f w - a) (Metric.ball (0 : ℂ) r) z)

def UnboundedCountRatio (f : ℂ → ℂ) (a b : ℂ) : Prop :=
  ∀ M : ℕ, ∀ R : ℝ, ∃ r : ℝ, R < r ∧
    0 < aPointCount f r b ∧ M * aPointCount f r b < aPointCount f r a

theorem erdos_1116 :
    ∃ f : ℂ → ℂ, Differentiable ℂ f ∧ ∀ a b : ℂ, a ≠ b → UnboundedCountRatio f a b := by
  sorry

end Erdos1116
