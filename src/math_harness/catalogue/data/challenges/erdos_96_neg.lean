import Mathlib

open Filter

open EuclideanGeometry

open scoped EuclideanGeometry

namespace Erdos96

open Finset

noncomputable def convexUnitDistanceCounts (n : ℕ) : Set ℕ :=
  {unitDistNum points | (points : Finset ℝ²) (_ : points.card = n) (_ : ConvexIndep points)}

theorem convexUnitDistanceCounts_bddAbove (n : ℕ) : BddAbove <| convexUnitDistanceCounts n := by
  use n.choose 2
  rintro _ ⟨points, rfl, _, rfl⟩
  exact unitDistNum_le_choose_two points

noncomputable def maxConvexUnitDistances (n : ℕ) : ℕ :=
  sSup (convexUnitDistanceCounts n)

theorem erdos_96_neg :
    ¬ ((fun n => (maxConvexUnitDistances n : ℝ)) =O[atTop] fun n => (n : ℝ)) := by
  sorry

end Erdos96
