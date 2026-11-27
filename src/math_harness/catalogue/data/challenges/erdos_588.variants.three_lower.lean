import Mathlib

open EuclideanGeometry Filter Asymptotics

namespace Erdos588

noncomputable def numLinesWithPointsMax (k n : ℕ) : ℕ :=
  sSup {((linesWithPointsFor k S).ncard) | (S : Set ℝ²)
    (_ : S.ncard = n) (_ : S.Finite) (_ : NonCollinearFor (k + 1) S)}

theorem erdos_588.variants.three_lower :
    ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (1 / 6 - ε) * (n : ℝ) ^ 2 ≤ (numLinesWithPointsMax 3 n : ℝ) := by
  sorry

end Erdos588
