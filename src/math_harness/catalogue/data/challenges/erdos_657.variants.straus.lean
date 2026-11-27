import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos657

theorem erdos_657.variants.straus (k : ℕ) :
    ∃ A : Finset (ℝ^k), A.card = 2 ^ k ∧ (A : Set (ℝ^k)).IsIsoscelesFree ∧ distinctDistances A ≤ 2 ^ k - 1 := by
  sorry

end Erdos657
