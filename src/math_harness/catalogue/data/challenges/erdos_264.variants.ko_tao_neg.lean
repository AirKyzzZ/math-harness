import Mathlib

namespace Erdos264

open Filter

open scoped ENNReal Asymptotics

def IsIrrationalitySequence (a : ℕ → ℕ) : Prop := ∀ b : ℕ → ℤ,
  BddAbove (Set.range b) → BddBelow (Set.range b) →
  0 ∉ Set.range (fun n ↦ (a n : ℤ) + b n) → 0 ∉ Set.range b →
  Irrational (∑' n, (1 : ℝ) / ((a n : ℤ) + b n))

theorem erdos_264.variants.ko_tao_neg {a : ℕ → ℕ} (h₁ : StrictMono a) (h₂ : 0 ∉ Set.range a) (h₃ : Summable ((1 : ℝ) / a ·)) (h₄ : ∃ C > 0, ∀ᶠ n in atTop, C ≤ a n ^ 2 * ∑' k : Set.Ioi n, (1 : ℝ) / a k ^ 2) :
    ¬IsIrrationalitySequence a := by
  sorry

end Erdos264
