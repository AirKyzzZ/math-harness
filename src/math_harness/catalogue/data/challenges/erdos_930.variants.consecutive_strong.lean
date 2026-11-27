import Mathlib

open Finset

namespace Erdos930

def IsPower (n : ℕ) : Prop :=
  ∃ m l, 1 < l ∧ m^l = n

def nextPrime (k : ℕ) : ℕ :=
  Nat.find (Nat.exists_infinite_primes k)

theorem erdos_930.variants.consecutive_strong :
    ∀ k l n, 3 ≤ k → 2 ≤ l → nextPrime k ≤ n + k → ∃ p, k ≤ p ∧ p.Prime ∧ ¬ (l ∣ Nat.factorization (∏ m ∈ Icc (n + 1) (n + k), m) p) := by
  sorry

end Erdos930
