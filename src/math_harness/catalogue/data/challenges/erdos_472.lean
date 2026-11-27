import Mathlib

namespace Erdos472

def InitialPrimeSegment (m : ℕ) (q : ℕ → ℕ) : Prop :=
  0 < m ∧
    (∀ i : ℕ, i < m → Nat.Prime (q i)) ∧
      ∀ i j : ℕ, i < j → j < m → q i < q j

def EligibleNextPrime (q : ℕ → ℕ) (prev t r : ℕ) : Prop :=
  Nat.Prime r ∧
    q prev < r ∧
      ∃ i : ℕ, i < t ∧ r = q prev + q i - 1

def UlamPrimeExtension (m : ℕ) (q : ℕ → ℕ) : Prop :=
  InitialPrimeSegment m q ∧
    ∀ t : ℕ,
      m ≤ t →
        IsLeast {r : ℕ | EligibleNextPrime q (t - 1) t r} (q t)

theorem erdos_472 :
    ∃ m : ℕ, ∃ q : ℕ → ℕ, UlamPrimeExtension m q := by
  sorry

end Erdos472
