import Mathlib

namespace Erdos453

def EventuallyHasPrimeWitness : Prop :=
  ∃ N : ℕ, ∀ n : ℕ, N ≤ n →
    ∃ i : ℕ, i < n ∧
      (Nat.nth Nat.Prime n) ^ (2 : ℕ) <
        Nat.nth Nat.Prime (n + i) * Nat.nth Nat.Prime (n - i)

theorem erdos_453 :
    ¬ EventuallyHasPrimeWitness := by
  sorry

end Erdos453
