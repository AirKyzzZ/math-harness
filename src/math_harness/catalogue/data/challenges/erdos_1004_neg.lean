import Mathlib

open Filter Real Nat

namespace Erdos1004

def IsDistinctTotientRun (n K : ℕ) : Prop :=
  (Set.Icc (n + 1) (n + K)).InjOn totient

theorem erdos_1004_neg :
    ¬ (∀ c > (0 : ℝ), ∀ᶠ x in atTop, ∃ n ≤ x, IsDistinctTotientRun n ⌊(Real.log (x : ℝ)) ^ c⌋₊) := by
  sorry

end Erdos1004
