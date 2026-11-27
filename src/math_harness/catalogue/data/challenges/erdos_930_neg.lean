import Mathlib

open Finset

namespace Erdos930

def IsPower (n : ℕ) : Prop :=
  ∃ m l, 1 < l ∧ m^l = n

theorem erdos_930_neg :
    ¬ (∀ r > 0, ∃ k, ∀ I₁ I₂ : Fin r → ℕ, (∀ i : Fin r, 0 < I₁ i ∧ I₁ i + k ≤ I₂ i + 1) → (∀ i j : Fin r, i < j → I₂ i < I₁ j) → ¬ IsPower (∏ i : Fin r, ∏ m ∈ Icc (I₁ i) (I₂ i), m)) := by
  sorry

def nextPrime (k : ℕ) : ℕ :=
  Nat.find (Nat.exists_infinite_primes k)

end Erdos930
