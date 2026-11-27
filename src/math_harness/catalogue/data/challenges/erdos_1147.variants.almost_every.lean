import Mathlib

open Filter MeasureTheory

namespace Erdos1147

def recurrenceSet (α : ℝ) (ε : ℕ → ℝ) : Set ℕ :=
  {n | 1 ≤ n ∧ distToNearestInt (α * n ^ 2) < ε n}

theorem erdos_1147.variants.almost_every :
    ∀ ε : ℕ → ℝ, Tendsto ε atTop (nhds 0) → ∀ᵐ α : ℝ, 0 < α → ¬ (recurrenceSet α ε).IsAsymptoticAddBasisOfOrder 2 := by
  sorry

end Erdos1147
