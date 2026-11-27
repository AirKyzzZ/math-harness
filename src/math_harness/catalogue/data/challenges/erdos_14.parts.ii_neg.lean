import Mathlib

namespace Erdos14

open Asymptotics Filter

noncomputable def nonUniqueSumCount (A : Set ℕ) (N : ℕ) : ℝ :=
  ((Set.Icc 1 N) \ (allUniqueSums A)).ncard

noncomputable def almostSquareRoot (ε : ℝ) (N : ℕ) : ℝ :=
  N ^ (1/2 - ε)

noncomputable def squareRoot (N : ℕ) : ℝ :=
  Real.sqrt N

theorem erdos_14.parts.ii_neg :
    ¬ (∃ (A : Set ℕ), IsLittleO atTop (nonUniqueSumCount A) squareRoot) := by
  sorry

end Erdos14
