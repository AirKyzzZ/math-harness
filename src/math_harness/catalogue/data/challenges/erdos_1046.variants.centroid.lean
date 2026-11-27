import Mathlib

open Polynomial Metric

namespace Erdos1046

def lemniscate (f : ℂ[X]) : Set ℂ := {z | ‖f.eval z‖ < 1}

def closedLemniscate (f : ℂ[X]) : Set ℂ := {z | ‖f.eval z‖ ≤ 1}

theorem erdos_1046.variants.centroid :
    ∀ f : ℂ[X], f.Monic → IsConnected (lemniscate f) → lemniscate f ⊆ ball (f.roots.sum / f.natDegree) 2 := by
  sorry

end Erdos1046
