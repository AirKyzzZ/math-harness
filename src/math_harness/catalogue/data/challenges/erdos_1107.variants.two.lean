import Mathlib

namespace Erdos1107

open Nat Filter

def SumOfRPowerful (r n : ℕ) : Prop :=
  ∃ s : List ℕ, s.length ≤ r + 1 ∧ (∀ x ∈ s, Nat.Full r x) ∧ s.sum = n

theorem erdos_1107.variants.two :
    ∀ᶠ n in atTop, SumOfRPowerful 2 n := by
  sorry

end Erdos1107
