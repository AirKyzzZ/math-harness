import Mathlib

namespace Erdos1136

def AvoidsPowersOfTwo (A : Set ℕ) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ k : ℕ, a + b ≠ 2 ^ k

def muellerSet : Set ℕ := {n | ∃ i : ℕ, n ≡ 3 * 2 ^ i [MOD 2 ^ (i + 2)]}

theorem erdos_1136_neg :
    ¬ (∃ A : Set ℕ, (1 / 3 : ℝ) < A.lowerDensity ∧ AvoidsPowersOfTwo A) := by
  sorry

end Erdos1136
