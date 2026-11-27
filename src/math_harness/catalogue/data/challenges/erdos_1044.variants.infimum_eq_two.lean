import Mathlib

open Polynomial ENNReal

namespace Erdos1044

def IsAdmissible (f : ℂ[X]) : Prop :=
  ∃ n : ℕ, 0 < n ∧ ∃ z : Fin n → ℂ, (∀ i, ‖z i‖ ≤ 1) ∧ f = ∏ i, (X - C (z i))

noncomputable def maxBoundaryLength (f : ℂ[X]) : ℝ≥0∞ :=
  ⨆ z ∈ {w : ℂ | ‖f.eval w‖ < 1},
    Erdos1041.length (frontier (connectedComponentIn {w : ℂ | ‖f.eval w‖ < 1} z))

def erdos_1044.answer : ℝ≥0∞ := 2

theorem erdos_1044.variants.infimum_eq_two :
    IsGLB {L : ℝ≥0∞ | ∃ f : ℂ[X], IsAdmissible f ∧ maxBoundaryLength f = L} 2 := by
  sorry

end Erdos1044
