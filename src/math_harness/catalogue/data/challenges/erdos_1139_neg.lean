import Mathlib

open Nat Filter

open scoped ArithmeticFunction.Omega

open scoped Topology

namespace Erdos1139

theorem erdos_1139_neg :
    ¬ (letI u := Nat.nth (fun n ↦ 0 < n ∧ Ω n ≤ 2) atTop.limsup (fun k : ℕ ↦ (((u (k + 1) : ℝ) - (u k : ℝ)) / Real.log (↑k + 1) : EReal)) = ⊤) := by
  sorry

end Erdos1139
