import Mathlib

open Nat Real Filter Set

open scoped Topology Asymptotics

namespace Erdos1057

noncomputable def carmichaelCounting (x : ℝ) : ℝ :=
  ({n : ℕ | IsCarmichael n ∧ (n : ℝ) ≤ x}.ncard : ℝ)

theorem erdos_1057.variants.agp_lower_bound :
    ∀ᶠ x in atTop, carmichaelCounting x > x ^ (2 / 7 : ℝ) := by
  sorry

end Erdos1057
