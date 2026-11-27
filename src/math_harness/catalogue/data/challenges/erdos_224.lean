import Mathlib

namespace Erdos224

open scoped EuclideanGeometry

def ObtuseAt {d : ℕ} (x y z : ℝ^d) : Prop :=
  inner ℝ (y - x) (z - x) < 0

theorem erdos_224 {d : ℕ} (A : Finset (ℝ^d)) (hcard : A.card = 2 ^ d + 1) :
    ∃ x y z : ℝ^d, x ∈ A ∧ y ∈ A ∧ z ∈ A ∧ x ≠ y ∧ x ≠ z ∧ y ≠ z ∧ ObtuseAt x y z := by
  sorry

end Erdos224
