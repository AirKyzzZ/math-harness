import Mathlib

open Filter EuclideanGeometry

namespace Erdos95

theorem erdos_95_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ∃ C : ℝ, 0 < C ∧ ∀ P : Finset ℝ², ∑ u ∈ distanceSet P, (distanceMultiplicity P u : ℝ) ^ 2 ≤ C * (P.card : ℝ) ^ (3 + ε)) := by
  sorry

end Erdos95
