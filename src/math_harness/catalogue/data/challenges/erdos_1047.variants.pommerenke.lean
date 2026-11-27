import Mathlib

open Polynomial

namespace Erdos1047

def sublevelSet (f : ℂ[X]) (c : ℝ) : Set ℂ := {z : ℂ | ‖f.eval z‖ ≤ c}

def strictSublevelSet (f : ℂ[X]) (c : ℝ) : Set ℂ := {z : ℂ | ‖f.eval z‖ < c}

def componentsIn (s : Set ℂ) : Set (Set ℂ) :=
  {t : Set ℂ | ∃ z ∈ s, t = connectedComponentIn s z}

theorem erdos_1047.variants.pommerenke :
    ∀ᶠ k : ℕ in Filter.atTop, ∃ δ : ℝ, 0 < δ ∧ ∀ a : ℝ, (1 + 1 / (k : ℝ)) * (k : ℝ) ^ ((1 : ℝ) / ((k : ℝ) + 1)) < a → a < (1 + 1 / (k : ℝ)) * (k : ℝ) ^ ((1 : ℝ) / ((k : ℝ) + 1)) + δ → (componentsIn (sublevelSet (X ^ k * (X - C (a : ℂ))) 1)).ncard = 2 ∧ ¬ Convex ℝ (connectedComponentIn (sublevelSet (X ^ k * (X - C (a : ℂ))) 1) 0) := by
  sorry

def erdos_1047.variants.max_non_convex_components.answer (n : ℕ) : ℕ :=
  if n ≤ 1 then 0 else if n = 2 then 1 else if n = 3 then 2 else n

end Erdos1047
