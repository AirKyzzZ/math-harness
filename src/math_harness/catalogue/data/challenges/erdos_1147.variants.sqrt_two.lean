import Mathlib

open Filter MeasureTheory

namespace Erdos1147

def recurrenceSet (α : ℝ) (ε : ℕ → ℝ) : Set ℕ :=
  {n | 1 ≤ n ∧ distToNearestInt (α * n ^ 2) < ε n}

theorem erdos_1147.variants.sqrt_two :
    ¬ (recurrenceSet (√2) fun n ↦ 1 / Real.log n).IsAsymptoticAddBasisOfOrder 2 := by
  sorry

end Erdos1147
