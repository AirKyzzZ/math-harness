import Mathlib

open EuclideanGeometry Filter Asymptotics

namespace Erdos588

noncomputable def numLinesWithPointsMax (k n : ℕ) : ℕ :=
  sSup {((linesWithPointsFor k S).ncard) | (S : Set ℝ²)
    (_ : S.ncard = n) (_ : S.Finite) (_ : NonCollinearFor (k + 1) S)}

theorem erdos_588.variants.karteszi :
    ∀ k : ℕ, 4 ≤ k → ∃ c > (0 : ℝ), ∀ᶠ n : ℕ in atTop, c * (n : ℝ) * Real.log (n : ℝ) ≤ (numLinesWithPointsMax k n : ℝ) := by
  sorry

end Erdos588
