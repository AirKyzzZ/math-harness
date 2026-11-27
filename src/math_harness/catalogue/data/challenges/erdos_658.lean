import Mathlib

open Filter

namespace Erdos658

theorem erdos_658 :
    ∀ δ : ℝ, 0 < δ → ∀ᶠ N : ℕ in atTop, ∀ A : Finset (ℕ × ℕ), A ⊆ Finset.Icc 1 N ×ˢ Finset.Icc 1 N → δ * N ^ 2 ≤ A.card → ∃ a b d : ℕ, 0 < d ∧ (a, b) ∈ A ∧ (a + d, b) ∈ A ∧ (a, b + d) ∈ A ∧ (a + d, b + d) ∈ A := by
  sorry

end Erdos658
