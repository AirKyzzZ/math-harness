import Mathlib

open MeasureTheory

namespace Erdos116

theorem erdos_116.variants.upper :
    ∃ C : ℝ, ∀ n : ℕ, 3 ≤ n → ∃ z : Fin n → ℂ, (∀ i, ‖z i‖ ≤ 1) ∧ volume {w : ℂ | ‖∏ i, (w - z i)‖ < 1} ≤ ENNReal.ofReal (C / Real.log (Real.log n)) := by
  sorry

end Erdos116
