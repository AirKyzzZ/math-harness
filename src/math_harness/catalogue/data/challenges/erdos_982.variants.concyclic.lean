import Mathlib

open EuclideanGeometry

namespace Erdos982

theorem erdos_982.variants.concyclic {n : ℕ} (p : Fin n → ℝ²) (hp : Function.Injective p) (c : ℝ²) (R : ℝ) (hR : ∀ j, dist (p j) c = R) (i : Fin n) :
    { d : ℝ | ∃ j : Fin n, j ≠ i ∧ d = dist (p i) (p j) }.ncard ≥ n / 2 := by
  sorry

end Erdos982
