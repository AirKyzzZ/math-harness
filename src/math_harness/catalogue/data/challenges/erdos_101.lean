import Mathlib

namespace Erdos101

open EuclideanGeometry Filter Asymptotics

noncomputable def numLinesWithFourPointMax (n : ℕ) : ℕ :=
  sSup {((linesWithPointsFor 4 S).ncard)| (S : Set ℝ²)
    (_ : S.ncard = n) (_ : S.Finite) (_ : NonCollinearFor 5 S)}

theorem erdos_101 :
    (fun n => (numLinesWithFourPointMax n : ℝ)) =o[atTop] (fun n => (n : ℝ)^2) := by
  sorry

-- TODO(firsching): formalize other results from the additional material

end Erdos101
