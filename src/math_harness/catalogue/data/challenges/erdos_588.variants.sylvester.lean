import Mathlib

open EuclideanGeometry Filter Asymptotics

namespace Erdos588

noncomputable def numLinesWithPointsMax (k n : ℕ) : ℕ :=
  sSup {((linesWithPointsFor k S).ncard) | (S : Set ℝ²)
    (_ : S.ncard = n) (_ : S.Finite) (_ : NonCollinearFor (k + 1) S)}

theorem erdos_588.variants.sylvester :
    (fun n : ℕ ↦ (numLinesWithPointsMax 3 n : ℝ) - (n : ℝ) ^ 2 / 6) =O[atTop] (fun n : ℕ ↦ (n : ℝ)) := by
  sorry

end Erdos588
