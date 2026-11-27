import Mathlib

namespace Erdos506

open EuclideanGeometry

noncomputable def numCircles (P : Set ℝ²) : ℕ :=
  Set.ncard { s : Sphere ℝ² | 3 ≤ {p ∈ P | p ∈ s}.ncard }

-- Formalisation notes:

-- * Following Elliott, the non-degeneracy condition used here is the weaker of the two: the points

--   are not all on a line and not all on a circle.

-- * The hypothesis `4 ≤ n` is not a restriction of the problem, but excludes the degenerate range

--   where no admissible configuration exists: fewer than three points are collinear, and any three

--   non-collinear points lie on a common circle, so the set below is empty for `n < 4`.

def erdos_506.variants.large_n.answer (n : ℕ) : ℕ := (n - 1).choose 2 + 1 - (n - 1) / 2

theorem erdos_506.variants.segre_n_eq_eight :
    ∃ P : Finset ℝ², P.card = 8 ∧ ¬ Collinear ℝ (P : Set ℝ²) ∧ ¬ Cospherical (P : Set ℝ²) ∧ numCircles (P : Set ℝ²) < (8 - 1).choose 2 := by
  sorry

end Erdos506
