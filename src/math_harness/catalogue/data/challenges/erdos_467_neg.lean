import Mathlib

namespace Erdos467

open Filter

def primesUpTo (x : ℕ) : Finset ℕ :=
  (Finset.Icc 2 x).filter Nat.Prime

def PrimePartitionUpTo (x : ℕ) (A B : Finset ℕ) : Prop :=
  A.Nonempty ∧
    B.Nonempty ∧
      A ∪ B = primesUpTo x ∧
        A ∩ B = ∅

def CongruenceCover (x : ℕ) (residue : ℕ → ℕ) (A B : Finset ℕ) : Prop :=
  ∀ n : ℕ,
    n < x →
      (∃ p : ℕ, p ∈ A ∧ n % p = residue p % p) ∧
        ∃ q : ℕ, q ∈ B ∧ n % q = residue q % q

theorem erdos_467_neg :
    ¬ (∀ᶠ x in atTop, ∃ residue : ℕ → ℕ, ∃ A B : Finset ℕ, PrimePartitionUpTo x A B ∧ CongruenceCover x residue A B) := by
  sorry

end Erdos467
