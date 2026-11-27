import Mathlib

open scoped EuclideanGeometry

namespace Erdos660

def IsPolyhedronVertices (P : Finset ℝ³) : Prop :=
  ConvexIndependent ℝ ((↑) : ↥(P : Set ℝ³) → ℝ³) ∧ affineSpan ℝ (P : Set ℝ³) = ⊤

theorem erdos_660.variants.Er75f :
    ∃ c > (0 : ℝ), ∀ᶠ n in Filter.atTop, ∀ P : Finset ℝ³, P.card = n → IsPolyhedronVertices P → c * n ≤ (distinctDistances P : ℝ) := by
  sorry

end Erdos660
