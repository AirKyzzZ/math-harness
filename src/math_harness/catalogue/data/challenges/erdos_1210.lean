import Mathlib

open Finset

namespace Erdos1210

theorem erdos_1210 :
    ∃ C : ℝ, ∀ n : ℕ, ∀ A : Finset ℕ, (∀ a ∈ A, 1 ≤ a ∧ a < n) → (∀ a ∈ A, ∀ b ∈ A, a ≠ b → a.Coprime b) → ∑ a ∈ A, (1 / ((n : ℝ) - a)) ≤ (∑ p ∈ (range n).filter Prime, (1 / (p : ℝ))) + C := by
  sorry

end Erdos1210
