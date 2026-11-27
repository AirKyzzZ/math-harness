import Mathlib

open Filter EuclideanGeometry

namespace Erdos94

noncomputable def regularNGon (n : ℕ) : Finset ℝ² :=
  (Finset.range n).image fun k : ℕ =>
    !₂[Real.cos (2 * Real.pi * k / n), Real.sin (2 * Real.pi * k / n)]

theorem erdos_94.variants.sum_multiplicity (P : Finset ℝ²) :
    ∑ u ∈ distanceSet P, distanceMultiplicity P u = P.card.choose 2 :=
  sum_distanceMultiplicity P

theorem erdos_94.variants.no_three_on_a_line :
    ∃ C > (0 : ℝ), ∀ P : Finset ℝ², NonTrilinear (P : Set ℝ²) → ∑ u ∈ distanceSet P, (distanceMultiplicity P u : ℝ) ^ 2 ≤ C * (P.card : ℝ) ^ 3 := by
  sorry

end Erdos94
