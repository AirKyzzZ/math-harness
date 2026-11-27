import Mathlib

open Filter

open scoped Pointwise

namespace Erdos806

theorem erdos_806_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, ∀ A : Finset ℕ, A ⊆ Finset.Icc 1 n → (A.card : ℝ) ≤ √n → ∃ B : Finset ℤ, A.map Nat.castEmbedding ⊆ B + B ∧ (B.card : ℝ) ≤ ε * √n) := by
  sorry

end Erdos806
