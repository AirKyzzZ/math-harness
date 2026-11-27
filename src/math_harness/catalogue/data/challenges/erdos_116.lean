import Mathlib

open MeasureTheory

namespace Erdos116

theorem erdos_116 :
    ∃ c : ℝ, 0 < c ∧ ∃ C : ℕ, ∀ n : ℕ, 0 < n → ∀ z : Fin n → ℂ, (∀ i, ‖z i‖ ≤ 1) → ENNReal.ofReal (c / n ^ C) ≤ volume {w : ℂ | ‖∏ i, (w - z i)‖ < 1} := by
  sorry

end Erdos116
