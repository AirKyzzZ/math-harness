import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos706

theorem erdos_706 :
    ∃ C : ℕ, ∀ᶠ r : ℕ in atTop, ∀ (P : Finset ℝ²) (A : Finset ℝ), A.card = r → (∀ a ∈ A, 0 < a) → (SimpleGraph.DistancePlaneGraph (A : Set ℝ) (P : Set ℝ²)).chromaticNumber ≤ (r ^ C : ℕ) := by
  sorry

end Erdos706
