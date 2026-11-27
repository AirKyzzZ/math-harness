import Mathlib

open Nat Set

namespace Erdos1142

def Erdos1142Prop (n : ℕ) : Prop :=
  2 < n ∧ ∀ k, 0 < k → 2 ^ k < n → (n - 2 ^ k).Prime

theorem erdos_1142_neg :
    ¬ (Infinite { n | Erdos1142Prop n }) := by
  sorry

local macro "prove_erdos_1142_prop" bound:num : tactic =>

  `(tactic| (

    refine ⟨by omega, fun k hk hlt => ?_⟩

    have : k ≤ $bound := by

      by_contra! h

      exact absurd (Nat.pow_le_pow_right (by omega : 1 ≤ 2) h) (by omega)

    interval_cases k <;> simp_all (config := { decide := true })))

theorem erdos_1142.test_4 : Erdos1142Prop 4 := by prove_erdos_1142_prop 1

theorem erdos_1142.test_7 : Erdos1142Prop 7 := by prove_erdos_1142_prop 2

theorem erdos_1142.test_15 : Erdos1142Prop 15 := by prove_erdos_1142_prop 3

theorem erdos_1142.test_21 : Erdos1142Prop 21 := by prove_erdos_1142_prop 4

theorem erdos_1142.test_45 : Erdos1142Prop 45 := by prove_erdos_1142_prop 5

theorem erdos_1142.test_75 : Erdos1142Prop 75 := by prove_erdos_1142_prop 6

theorem erdos_1142.test_105 : Erdos1142Prop 105 := by prove_erdos_1142_prop 6

theorem erdos_1142.test_not_106 : ¬ Erdos1142Prop 106 := by
  intro ⟨_, h⟩
  have := h 1 (by omega) (by omega)
  revert this; decide

end Erdos1142
