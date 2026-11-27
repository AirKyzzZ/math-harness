import Mathlib

namespace Erdos141

def Set.IsPrimeProgressionOfLength (s : Set ℕ) (l : ℕ∞) : Prop :=
    ∃ a, ENat.card s = l ∧ s = {(a + n).nth Nat.Prime | (n : ℕ) (_ : n < l)}

open Nat Erdos141

theorem first_three_odd_primes : ({3, 5, 7} : Set ℕ).IsPrimeProgressionOfLength 3 := by
  use 1
  constructor
  · aesop
  · norm_num [exists_lt_succ_right, Nat.le_one_iff_eq_zero_or_eq_one]
    grind

def Set.IsAPAndPrimeProgressionOfLength (s : Set ℕ) (l : ℕ) :=
   s.IsAPOfLength l ∧ s.IsPrimeProgressionOfLength l

theorem exists_three_consecutive_primes_in_ap : ∃ (s : Set ℕ), s.IsAPAndPrimeProgressionOfLength 3 := by
  use {3, 5, 7}
  constructor
  · use 3, 2
    unfold Set.IsAPOfLengthWith
    constructor
    · aesop
    · norm_num [exists_lt_succ_right, Nat.le_one_iff_eq_zero_or_eq_one]
      grind
  · exact first_three_odd_primes

theorem erdos_141 :
    ∀ k ≥ 3, ∃ (s : Set ℕ), s.IsAPAndPrimeProgressionOfLength k := by
  sorry

def consecutivePrimeArithmeticProgressions (k : ℕ) : Set (Set ℕ) :=
  {s | s.IsAPAndPrimeProgressionOfLength k}

end Erdos141
