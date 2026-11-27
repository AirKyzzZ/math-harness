import Mathlib

open Filter

open scoped Pointwise

namespace Erdos806

theorem erdos_806.variants.alon_bukh_sudakov :
    ∃ C : ℝ, ∀ᶠ n : ℕ in atTop, ∀ A : Finset ℕ, A ⊆ Finset.Icc 1 n → (A.card : ℝ) ≤ √n → ∃ B : Finset ℤ, A.map Nat.castEmbedding ⊆ B + B ∧ (B.card : ℝ) ≤ C * Real.log (Real.log n) / Real.log n * √n := by
  sorry

end Erdos806
