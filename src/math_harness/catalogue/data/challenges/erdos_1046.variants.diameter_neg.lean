import Mathlib

open Polynomial Metric

namespace Erdos1046

def lemniscate (f : ℂ[X]) : Set ℂ := {z | ‖f.eval z‖ < 1}

def closedLemniscate (f : ℂ[X]) : Set ℂ := {z | ‖f.eval z‖ ≤ 1}

theorem erdos_1046.variants.diameter_neg :
    ¬ (∀ f : ℂ[X], f.Monic → IsConnected (closedLemniscate f) → 2 ≤ Metric.ediam (closedLemniscate f)) := by
  sorry

end Erdos1046
