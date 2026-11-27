import Mathlib

namespace Erdos969

open Filter Asymptotics

def squarefreeCounting (x : ℕ) : ℕ :=
  ((Finset.Icc 1 x).filter Squarefree).card

theorem squarefreeCounting_ten : squarefreeCounting 10 = 7 := by
  decide +kernel

noncomputable def squarefreeCountingError (x : ℕ) : ℝ :=
  (squarefreeCounting x : ℝ) - 6 / Real.pi ^ 2 * x

theorem erdos_969.variants.evelyn_linfoot :
    ¬(fun x => |squarefreeCountingError x|) =o[atTop] (fun x : ℕ => (x : ℝ) ^ (1 / 4 : ℝ)) := by
  sorry

end Erdos969
