import Mathlib

namespace Erdos264

open Filter

open scoped ENNReal Asymptotics

def IsIrrationalitySequence (a : ℕ → ℕ) : Prop := ∀ b : ℕ → ℤ,
  BddAbove (Set.range b) → BddBelow (Set.range b) →
  0 ∉ Set.range (fun n ↦ (a n : ℤ) + b n) → 0 ∉ Set.range b →
  Irrational (∑' n, (1 : ℝ) / ((a n : ℤ) + b n))

theorem erdos_264.variants.example :
    IsIrrationalitySequence (fun n ↦ 2 ^ (2 ^ n)) := by
  sorry

end Erdos264
