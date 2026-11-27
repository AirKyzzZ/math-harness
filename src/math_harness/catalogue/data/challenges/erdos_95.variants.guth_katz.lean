import Mathlib

open Filter EuclideanGeometry

namespace Erdos95

theorem erdos_95.variants.guth_katz :
    ∃ C : ℝ, 0 < C ∧ ∀ P : Finset ℝ², 2 ≤ P.card → ∑ u ∈ distanceSet P, (distanceMultiplicity P u : ℝ) ^ 2 ≤ C * (P.card : ℝ) ^ 3 * Real.log P.card := by
  sorry

end Erdos95
