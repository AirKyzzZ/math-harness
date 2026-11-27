import Mathlib

namespace Erdos487

theorem erdos_487 :
    ∀ A : Set ℕ, A.HasPosDensity → ∃ a ∈ A, ∃ b ∈ A, ∃ c ∈ A, a ≠ b ∧ b ≠ c ∧ a ≠ c ∧ Nat.lcm a b = c := by
  sorry

end Erdos487
