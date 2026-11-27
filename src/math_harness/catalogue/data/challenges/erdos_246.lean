import Mathlib

namespace Erdos246

def Gamma (a b : ℕ) : Set ℕ :=
  {x | ∃ k l : ℕ, x = a ^ k * b ^ l}

theorem erdos_246 (a b : ℕ) (ha : 2 ≤ a) (hb : 2 ≤ b) (hab : Nat.Coprime a b) :
    IsAddComplete (Gamma a b) := by
  sorry

end Erdos246
