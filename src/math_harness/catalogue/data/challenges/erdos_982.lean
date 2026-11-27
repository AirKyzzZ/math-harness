import Mathlib

open EuclideanGeometry

namespace Erdos982

theorem erdos_982 (n : ℕ) (hn : 3 ≤ n) (p : Fin n → ℝ²) (hp : Function.Injective p) (hp' : EuclideanGeometry.IsConvexPolygon p) :
    ∃ (i : Fin n), { d : ℝ | ∃ j : Fin n, j ≠ i ∧ d = dist (p i) (p j) }.ncard ≥ n / 2 := by
  sorry

end Erdos982
