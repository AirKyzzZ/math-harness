import Mathlib

open EuclideanGeometry

namespace Erdos105

theorem erdos_105.variants.beck_szemeredi_trotter :
    ∃ c > (0 : ℝ), ∀ A B : Finset ℝ², Disjoint A B → (B.card : ℝ) ≤ c * A.card → ¬ Collinear ℝ (A : Set ℝ²) → ∃ p ∈ A, ∃ q ∈ A, p ≠ q ∧ ∀ b ∈ B, b ∉ line[ℝ, p, q] := by
  sorry

end Erdos105
