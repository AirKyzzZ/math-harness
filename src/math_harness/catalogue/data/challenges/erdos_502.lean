import Mathlib

open scoped EuclideanGeometry

namespace Erdos502

theorem erdos_502 (n : ℕ) (A : Set (ℝ^n)) (hA : A.Finite) (hA2 : {d : ℝ | ∃ x ∈ A, ∃ y ∈ A, x ≠ y ∧ dist x y = d}.ncard = 2) :
    A.ncard ≤ (n + 2).choose 2 := by
  sorry

end Erdos502
