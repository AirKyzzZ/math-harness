import Mathlib

namespace Erdos310

theorem erdos_310_neg :
    ¬ (∀ α : ℝ, 0 < α → ∃ C : ℕ, ∀ N : ℕ, 1 ≤ N → ∀ A ⊆ Finset.Icc 1 N, α * N ≤ A.card → ∃ S ⊆ A, ∃ a b : ℕ, 0 < a ∧ a ≤ b ∧ b ≤ C ∧ ∑ n ∈ S, (1 / n : ℚ) = a / b) := by
  sorry

end Erdos310
