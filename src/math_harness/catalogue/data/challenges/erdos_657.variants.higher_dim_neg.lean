import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos657

theorem erdos_657.variants.higher_dim_neg :
    ¬ (∀ k : ℕ, 1 ≤ k → ∃ f : ℕ → ℝ, Tendsto f atTop atTop ∧ ∀ n : ℕ, ∀ A : Finset (ℝ^k), A.card = n → (A : Set (ℝ^k)).IsIsoscelesFree → f n * (n : ℝ) ≤ (distinctDistances A : ℝ)) := by
  sorry

end Erdos657
