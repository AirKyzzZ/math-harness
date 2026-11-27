import Mathlib

open EuclideanGeometry

namespace Erdos105

theorem erdos_105.variants.sub_four :
    ¬ ∀ A B : Finset ℝ², Disjoint A B → A.card = B.card + 4 → ¬ Collinear ℝ (A : Set ℝ²) → ∃ p ∈ A, ∃ q ∈ A, p ≠ q ∧ ∀ b ∈ B, b ∉ line[ℝ, p, q] := by
  sorry

end Erdos105
