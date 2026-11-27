import Mathlib

open Filter

open scoped Pointwise

namespace Erdos806

theorem erdos_806.variants.erdos_newman :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 n ∧ c * √n ≤ A.card ∧ (A.card : ℝ) ≤ √n ∧ ∀ B : Finset ℤ, A.map Nat.castEmbedding ⊆ B + B → c * Real.log (Real.log n) / Real.log n * √n ≤ B.card := by
  sorry

end Erdos806
