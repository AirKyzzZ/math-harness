import Mathlib

open EuclideanGeometry Filter Asymptotics

namespace Erdos588

noncomputable def numLinesWithPointsMax (k n : ℕ) : ℕ :=
  sSup {((linesWithPointsFor k S).ncard) | (S : Set ℝ²)
    (_ : S.ncard = n) (_ : S.Finite) (_ : NonCollinearFor (k + 1) S)}

theorem erdos_588_neg :
    ¬ (∀ k : ℕ, 4 ≤ k → (fun n : ℕ ↦ (numLinesWithPointsMax k n : ℝ)) =o[atTop] (fun n : ℕ ↦ (n : ℝ) ^ 2)) := by
  sorry

end Erdos588
