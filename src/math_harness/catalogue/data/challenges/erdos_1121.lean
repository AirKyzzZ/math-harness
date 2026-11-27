import Mathlib

namespace Erdos1121

open scoped EuclideanGeometry

theorem erdos_1121 {n : ℕ} (c : Fin n → ℝ²) (r : Fin n → ℝ) (hr : ∀ i, 0 < r i) (hsep : ∀ (v : ℝ²) (t : ℝ), v ≠ 0 → (∀ i, ∀ p ∈ Metric.closedBall (c i) (r i), inner ℝ v p ≠ t) → (∀ i, inner ℝ v (c i) < t) ∨ (∀ i, t < inner ℝ v (c i))) :
    ∃ z : ℝ², (⋃ i, Metric.closedBall (c i) (r i)) ⊆ Metric.closedBall z (∑ i, r i) := by
  sorry

end Erdos1121
