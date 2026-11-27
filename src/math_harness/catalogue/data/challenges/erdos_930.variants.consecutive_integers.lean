import Mathlib

open Finset

namespace Erdos930

def IsPower (n : ℕ) : Prop :=
  ∃ m l, 1 < l ∧ m^l = n

def nextPrime (k : ℕ) : ℕ :=
  Nat.find (Nat.exists_infinite_primes k)

theorem erdos_930.variants.consecutive_integers :
    ∀ n k, 0 ≤ n → 2 ≤ k → ¬ IsPower (∏ m ∈ Icc (n + 1) (n + k), m) := by
  sorry

end Erdos930
