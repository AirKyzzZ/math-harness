import Mathlib

open Nat Real Filter Set

open scoped Topology Asymptotics

namespace Erdos1057

noncomputable def carmichaelCounting (x : ℝ) : ℝ :=
  ({n : ℕ | IsCarmichael n ∧ (n : ℝ) ≤ x}.ncard : ℝ)

theorem erdos_1057.variants.agp_infinite :
    Tendsto carmichaelCounting atTop atTop := by
  sorry

end Erdos1057
