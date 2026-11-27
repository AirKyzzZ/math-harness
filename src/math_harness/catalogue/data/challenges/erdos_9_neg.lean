import Mathlib

namespace Erdos9

def Erdos9A : Set ℕ := { n | Odd n ∧ ¬ ∃ (p k l : ℕ), (Nat.Prime p) ∧ n = p + 2 ^ k + 2 ^ l }

theorem erdos9A_contains_one : 1 ∈ Erdos9A := by
  constructor
  · decide
  · push Not
    intro p k l hp
    linarith [Nat.Prime.two_le hp, @Nat.one_le_two_pow k, @Nat.one_le_two_pow l]

theorem erdos9A_contains_three : 3 ∈ Erdos9A := by
  constructor
  · decide
  · push Not
    intro p k l hp
    linarith [Nat.Prime.two_le hp, @Nat.one_le_two_pow k, @Nat.one_le_two_pow l]

theorem erdos9A_not_contains_five : 5 ∉ Erdos9A := by
  unfold Erdos9A
  simp only [exists_and_left, not_exists, not_and, Set.mem_ofPred_eq, not_forall, Decidable.not_not]
  intro
  use 3, Nat.prime_three, 0, 0
  simp only [pow_zero, Nat.reduceAdd]

theorem erdos_9_neg :
    ¬ (0 < Erdos9A.upperDensity) := by
  sorry

end Erdos9
