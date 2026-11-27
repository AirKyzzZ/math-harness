import Mathlib

namespace Erdos972

def primeSet (α : ℝ) : Set ℕ :=
  {p : ℕ | Nat.Prime p ∧ Nat.Prime ⌊ (α * p) ⌋₊}

theorem erdos_972 :
    ∀ α > 1, Irrational α → (primeSet α).Infinite := by
  sorry

end Erdos972
