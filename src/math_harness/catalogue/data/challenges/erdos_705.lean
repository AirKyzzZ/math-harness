import Mathlib

namespace Erdos705

open scoped EuclideanGeometry

open SimpleGraph

theorem erdos_705 :
    ¬ ∃ k, ∀ V : Set ℝ², V.Finite → (UnitDistancePlaneGraph V).girth ≥ k → (UnitDistancePlaneGraph V).chromaticNumber ≤ 3 := by
  sorry

-- TODO: add statements for the concrete constructions in the additional material

end Erdos705
