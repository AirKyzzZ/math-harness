import Mathlib

open scoped EuclideanGeometry

namespace Erdos660

def IsPolyhedronVertices (P : Finset ℝ³) : Prop :=
  ConvexIndependent ℝ ((↑) : ↥(P : Set ℝ³) → ℝ³) ∧ affineSpan ℝ (P : Set ℝ³) = ⊤

theorem erdos_660.variants.altman_planar (n : ℕ) (P : Finset ℝ²) (hcard : P.card = n) (hconv : ConvexIndependent ℝ ((↑) : ↥(P : Set ℝ²) → ℝ²)) (haff : affineSpan ℝ (P : Set ℝ²) = ⊤) :
    n / 2 ≤ distinctDistances P := by
  sorry

end Erdos660
