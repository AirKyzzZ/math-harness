import Mathlib

namespace Erdos656

theorem erdos_656 :
    ∀ A : Set ℕ, 0 < A.upperDensity → ∃ B ⊆ A, B.Infinite ∧ ∃ t : ℤ, ∀ b₁ ∈ B, ∀ b₂ ∈ B, b₁ ≠ b₂ → ∃ a ∈ A, (a : ℤ) = b₁ + b₂ + t := by
  sorry

end Erdos656
