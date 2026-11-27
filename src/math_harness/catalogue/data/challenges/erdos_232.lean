import Mathlib

open Filter MeasureTheory

open scoped EuclideanGeometry

namespace Erdos232

noncomputable def ballDensity (A : Set ℝ²) (R : ℝ) : ℝ :=
  (volume (A ∩ Metric.ball 0 R)).toReal / (volume (Metric.ball (0 : ℝ²) R)).toReal

noncomputable def upperDensity (A : Set ℝ²) : ℝ :=
  limsup (ballDensity A) atTop

noncomputable def m₁ : ℝ :=
  sSup {d : ℝ | ∃ A : Set ℝ², NullMeasurableSet A volume ∧
    Erdos214.UnitDistanceAvoiding A ∧ upperDensity A = d}

theorem erdos_232 :
    m₁ ≤ 1 / 4 := by
  sorry

end Erdos232
