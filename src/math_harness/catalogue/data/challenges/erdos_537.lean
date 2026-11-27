import Mathlib

open Filter

namespace Erdos537

theorem erdos_537 :
    ¬ ∀ ε : ℝ, 0 < ε → ∀ᶠ N : ℕ in atTop, ∀ A ⊆ Finset.Icc 1 N, (A.card : ℝ) ≥ ε * N → ∃ a₁ ∈ A, ∃ a₂ ∈ A, ∃ a₃ ∈ A, ∃ p₁ p₂ p₃ : ℕ, p₁.Prime ∧ p₂.Prime ∧ p₃.Prime ∧ p₁ ≠ p₂ ∧ p₁ ≠ p₃ ∧ p₂ ≠ p₃ ∧ a₁ * p₁ = a₂ * p₂ ∧ a₂ * p₂ = a₃ * p₃ := by
  sorry

end Erdos537
