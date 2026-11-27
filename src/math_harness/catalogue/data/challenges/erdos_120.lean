import Mathlib

open Set MeasureTheory

namespace Erdos120

def Erdos120For (A : Set ℝ) : Prop := ∃ E : Set ℝ,
  MeasurableSet E ∧ 0 < volume E ∧ ∀ a b : ℝ, a ≠ 0 → ¬ .image (fun x => a * x + b) A ⊆ E

theorem erdos_120 :
    ∀ A : Set ℝ, A.Infinite → Erdos120For A := by
  sorry

end Erdos120
