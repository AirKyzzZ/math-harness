import Mathlib

open Filter

namespace Erdos490

theorem erdos_490.variants.limit :
    ∃ L : ℝ, Tendsto (fun N : ℕ => (sSup {x : ℝ | ∃ A B : Finset ℕ, A ⊆ Finset.Icc 1 N ∧ B ⊆ Finset.Icc 1 N ∧ (∀ a₁ ∈ A, ∀ b₁ ∈ B, ∀ a₂ ∈ A, ∀ b₂ ∈ B, a₁ * b₁ = a₂ * b₂ → a₁ = a₂ ∧ b₁ = b₂) ∧ x = A.card * B.card}) * Real.log N / N ^ 2) atTop (nhds L) := by
  sorry

end Erdos490
