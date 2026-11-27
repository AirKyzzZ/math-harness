import Mathlib

open Filter Real Nat

namespace Erdos1004

def IsDistinctTotientRun (n K : ℕ) : Prop :=
  (Set.Icc (n + 1) (n + K)).InjOn totient

theorem erdos_1004.variants.le_of_isDistinctTotientRun :
    ∃ (c : ℝ) (hc : c > 0), ∀ᶠ n in atTop, ∀ (K : ℕ), IsDistinctTotientRun n K → (K : ℝ) ≤ (n : ℝ) / Real.exp (c * (Real.log n) ^ (1/3 : ℝ)) := by
  sorry

end Erdos1004
