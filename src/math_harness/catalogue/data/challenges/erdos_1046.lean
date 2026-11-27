import Mathlib

open Polynomial Metric

namespace Erdos1046

def lemniscate (f : ℂ[X]) : Set ℂ := {z | ‖f.eval z‖ < 1}

def closedLemniscate (f : ℂ[X]) : Set ℂ := {z | ‖f.eval z‖ ≤ 1}

theorem erdos_1046 :
    ∀ f : ℂ[X], f.Monic → IsConnected (lemniscate f) → ∃ c : ℂ, lemniscate f ⊆ ball c 2 := by
  sorry

end Erdos1046
