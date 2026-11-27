import Mathlib

namespace Erdos1110

def Representable (p q n : ℕ) : Prop :=
  ∃ s : Finset ℕ,
    (s : Set ℕ) ⊆ Erdos246.Gamma p q ∧
    IsAntichain (· ∣ ·) (s : Set ℕ) ∧
    s.sum id = n

theorem erdos_1110_neg :
    ¬ (∀ (p q : ℕ), q < p → 2 ≤ q → Nat.Coprime p q → ¬(p = 3 ∧ q = 2) → ∃ A : Set ℕ, A.Infinite ∧ A.Pairwise Nat.Coprime ∧ ∀ n ∈ A, ¬Representable p q n) := by
  sorry

end Erdos1110
