import Mathlib

open MeasureTheory

namespace Erdos116

theorem erdos_116.variants.log :
    ∃ c : ℝ, 0 < c ∧ ∀ n : ℕ, 2 ≤ n → ∀ z : Fin n → ℂ, (∀ i, ‖z i‖ ≤ 1) → ENNReal.ofReal (c / Real.log n) ≤ volume {w : ℂ | ‖∏ i, (w - z i)‖ < 1} := by
  sorry

end Erdos116
