import Mathlib

open Nat Real Filter Set

open scoped Topology Asymptotics

namespace Erdos1057

noncomputable def carmichaelCounting (x : ℝ) : ℝ :=
  ({n : ℕ | IsCarmichael n ∧ (n : ℝ) ≤ x}.ncard : ℝ)

theorem erdos_1057.variants.upper_bound :
    ∃ c > 0, ∀ᶠ x in atTop, carmichaelCounting x < x * Real.exp (-c * (Real.log x * Real.log (Real.log (Real.log x))) / Real.log (Real.log x)) := by
  sorry

end Erdos1057
