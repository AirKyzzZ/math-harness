import Mathlib

open Polynomial

namespace Erdos1047

def sublevelSet (f : ℂ[X]) (c : ℝ) : Set ℂ := {z : ℂ | ‖f.eval z‖ ≤ c}

def strictSublevelSet (f : ℂ[X]) (c : ℝ) : Set ℂ := {z : ℂ | ‖f.eval z‖ < c}

def componentsIn (s : Set ℂ) : Set (Set ℂ) :=
  {t : Set ℂ | ∃ z ∈ s, t = connectedComponentIn s z}

theorem erdos_1047.variants.referee :
    (componentsIn (strictSublevelSet (X * (X ^ 5 - 1)) (5 * (6 : ℝ) ^ (-(6 : ℝ) / 5)))).ncard = 6 ∧ ∃ t ∈ componentsIn (strictSublevelSet (X * (X ^ 5 - 1)) (5 * (6 : ℝ) ^ (-(6 : ℝ) / 5))), ¬ Convex ℝ t := by
  sorry

def erdos_1047.variants.max_non_convex_components.answer (n : ℕ) : ℕ :=
  if n ≤ 1 then 0 else if n = 2 then 1 else if n = 3 then 2 else n

end Erdos1047
