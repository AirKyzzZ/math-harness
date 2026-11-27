import Mathlib

open MeasureTheory

namespace Erdos116

theorem erdos_116.variants.polya (n : ℕ) (z : Fin n → ℂ) :
    volume {w : ℂ | ‖∏ i, (w - z i)‖ < 1} ≤ ENNReal.ofReal Real.pi := by
  sorry

end Erdos116
