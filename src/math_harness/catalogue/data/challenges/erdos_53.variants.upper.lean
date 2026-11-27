import Mathlib

namespace Erdos53

def sumsAndProducts (A : Finset ℤ) : Finset ℤ :=
  (A.powerset.erase ∅).image (fun B => ∑ b ∈ B, b) ∪
    (A.powerset.erase ∅).image (fun B => ∏ b ∈ B, b)

theorem erdos_53.variants.upper :
    ∃ c : ℝ, 0 < c ∧ ∀ N : ℕ, ∃ A : Finset ℤ, N ≤ A.card ∧ ((sumsAndProducts A).card : ℝ) ≤ Real.exp (c * Real.log A.card ^ 2 / Real.log (Real.log A.card)) := by
  sorry

end Erdos53
