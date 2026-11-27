import Mathlib

namespace Erdos534

def IsAdmissible (N : ℕ) (A : Finset ℕ) : Prop :=
  A ⊆ Finset.Icc 1 N ∧ N ∈ A ∧ (A : Set ℕ).Pairwise fun a b ↦ 1 < Nat.gcd a b

noncomputable def maxCard (N : ℕ) : ℕ :=
  sSup {n | ∃ A : Finset ℕ, IsAdmissible N A ∧ A.card = n}

def primePrefix (N q : ℕ) : Finset ℕ := N.primeFactors.filter (· ≤ q)

def ahlswedeKhachatrian (N q : ℕ) : Finset ℕ :=
  (Finset.Icc 1 N).filter fun m ↦
    (∏ p ∈ primePrefix N q, p) ∣ m ∨ ∃ p ∈ primePrefix N q, 2 * p ∣ m

theorem erdos_534 (N : ℕ) (hN : 2 ≤ N) :
    ∃ q ∈ N.primeFactors, IsAdmissible N (ahlswedeKhachatrian N q) ∧ maxCard N = (ahlswedeKhachatrian N q).card := by
  sorry

end Erdos534
