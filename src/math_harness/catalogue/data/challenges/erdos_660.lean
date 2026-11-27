import Mathlib

open scoped EuclideanGeometry

namespace Erdos660

def IsPolyhedronVertices (P : Finset ℝ³) : Prop :=
  ConvexIndependent ℝ ((↑) : ↥(P : Set ℝ³) → ℝ³) ∧ affineSpan ℝ (P : Set ℝ³) = ⊤

theorem erdos_660 :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ n in Filter.atTop, ∀ P : Finset ℝ³, P.card = n → IsPolyhedronVertices P → (1 - ε) * ((n : ℝ) / 2) ≤ (distinctDistances P : ℝ) := by
  sorry

end Erdos660
