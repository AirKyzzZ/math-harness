import Mathlib

open Nat Real Filter Set

open scoped Topology Asymptotics

namespace Erdos1057

noncomputable def carmichaelCounting (x : ℝ) : ℝ :=
  ({n : ℕ | IsCarmichael n ∧ (n : ℝ) ≤ x}.ncard : ℝ)

theorem erdos_1057_neg :
    ¬ (Tendsto (fun x ↦ Real.log (carmichaelCounting x) / Real.log x) atTop (𝓝 1)) := by
  sorry

end Erdos1057
