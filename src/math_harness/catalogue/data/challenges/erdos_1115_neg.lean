import Mathlib

open MeasureTheory Filter

open scoped ENNReal

namespace Erdos1115

def IsArcLengthParam (γ : ℝ → ℂ) : Prop :=
  ∀ a b : ℝ, 0 ≤ a → a ≤ b → eVariationOn γ (Set.Icc a b) = ENNReal.ofReal (b - a)

def IsAsymptoticPath (f : ℂ → ℂ) (γ : ℝ → ℂ) : Prop :=
  IsArcLengthParam γ ∧ Tendsto (fun t : ℝ ↦ ‖f (γ t)‖) atTop atTop

noncomputable def lengthInDisc (γ : ℝ → ℂ) (r : ℝ) : ℝ≥0∞ :=
  volume {t : ℝ | 0 ≤ t ∧ ‖γ t‖ < r}

theorem lengthInDisc_mono (γ : ℝ → ℂ) {r r' : ℝ} (h : r ≤ r') :
    lengthInDisc γ r ≤ lengthInDisc γ r' := by
  unfold lengthInDisc
  exact measure_mono fun t ht ↦ ⟨ht.1, lt_of_lt_of_le ht.2 h⟩

theorem erdos_1115_neg :
    ¬ (¬ ∀ f : ℂ → ℂ, Erdos516.OfFiniteOrder f → (¬ ∃ a : ℂ, ∀ z, f z = a) → ∃ γ : ℝ → ℂ, IsAsymptoticPath f γ ∧ ∃ C : ℝ, ∀ᶠ r : ℝ in atTop, lengthInDisc γ r ≤ ENNReal.ofReal (C * r)) := by
  sorry

end Erdos1115
