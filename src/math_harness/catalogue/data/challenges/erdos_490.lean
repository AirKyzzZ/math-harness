import Mathlib

open Filter

namespace Erdos490

theorem erdos_490 :
    ∃ C : ℝ, ∀ᶠ N : ℕ in atTop, ∀ A B : Finset ℕ, A ⊆ Finset.Icc 1 N → B ⊆ Finset.Icc 1 N → (∀ a₁ ∈ A, ∀ b₁ ∈ B, ∀ a₂ ∈ A, ∀ b₂ ∈ B, a₁ * b₁ = a₂ * b₂ → a₁ = a₂ ∧ b₁ = b₂) → (A.card * B.card : ℝ) ≤ C * N ^ 2 / Real.log N := by
  sorry

end Erdos490
