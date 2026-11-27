import Mathlib

open Polynomial MeasureTheory ENNReal

namespace Erdos1041

section ComponentLemma

variable (n : ℕ) (f : ℂ[X]) (hn : n ≥ 2) (hnum : f.natDegree = n)

variable (h_monic : f.Monic)

variable (h : f.rootSet ℂ ⊆ Metric.ball 0 1)

include hn hnum h h_monic

noncomputable def length (s : Set ℂ) : ℝ≥0∞ := μH[1] s

end ComponentLemma

theorem erdos_1041 :
    ¬ ∀ (n : ℕ) (f : ℂ[X]), n ≥ 2 → f.natDegree = n → f.Monic → f.rootSet ℂ ⊆ Metric.ball 0 1 → ∃ (z₁ z₂ : ℂ) (h : ({z₁, z₂} : Multiset ℂ) ≤ f.roots) (γ : Path z₁ z₂), Set.range γ ⊆ { z : ℂ | ‖f.eval z‖ < 1 } ∧ length (Set.range γ) < 2 := by
  sorry

end Erdos1041
