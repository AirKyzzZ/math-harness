import Mathlib

namespace Erdos14

open Asymptotics Filter

noncomputable def nonUniqueSumCount (A : Set ℕ) (N : ℕ) : ℝ :=
  ((Set.Icc 1 N) \ (allUniqueSums A)).ncard

noncomputable def almostSquareRoot (ε : ℝ) (N : ℕ) : ℝ :=
  N ^ (1/2 - ε)

noncomputable def squareRoot (N : ℕ) : ℝ :=
  Real.sqrt N

theorem erdos_14.parts.i :
    ∀ A, ∀ ε > 0, nonUniqueSumCount A ≫ almostSquareRoot ε := by
  sorry

end Erdos14
