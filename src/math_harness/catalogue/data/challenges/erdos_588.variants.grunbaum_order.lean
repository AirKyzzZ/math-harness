import Mathlib

open EuclideanGeometry Filter Asymptotics

namespace Erdos588

noncomputable def numLinesWithPointsMax (k n : ℕ) : ℕ :=
  sSup {((linesWithPointsFor k S).ncard) | (S : Set ℝ²)
    (_ : S.ncard = n) (_ : S.Finite) (_ : NonCollinearFor (k + 1) S)}

theorem erdos_588.variants.grunbaum_order :
    ∀ k : ℕ, 4 ≤ k → ¬ (fun n : ℕ ↦ (numLinesWithPointsMax k n : ℝ)) =O[atTop] (fun n : ℕ ↦ (n : ℝ) ^ (1 + 1 / ((k : ℝ) - 2))) := by
  sorry

end Erdos588
