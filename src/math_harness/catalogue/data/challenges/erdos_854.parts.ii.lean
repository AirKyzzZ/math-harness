import Mathlib

open Filter Asymptotics

namespace Erdos854

noncomputable def kthPrimorial (k : ℕ) : ℕ :=
  ∏ i ∈ Finset.range k, Nat.nth Nat.Prime i

def gapSet (m : ℕ) : Finset ℕ :=
  (Erdos235.gaps m).toFinset

def maxGap (m : ℕ) : ℕ :=
  (gapSet m).sup id

noncomputable def minEvenNonGap (k : ℕ) : ℕ :=
  sInf {t : ℕ | 0 < t ∧ Even t ∧ t ∉ gapSet (kthPrimorial k)}

theorem kthPrimorial_three : kthPrimorial 3 = 30 := by
  simp [kthPrimorial, Finset.prod_range_succ, Nat.nth_prime_zero_eq_two,
    Nat.nth_prime_one_eq_three, Nat.nth_prime_two_eq_five]

theorem erdos_854.parts.ii :
    ∃ c > (0 : ℝ), ∀ᶠ k : ℕ in atTop, c * (maxGap (kthPrimorial k) : ℝ) ≤ ((gapSet (kthPrimorial k)).card : ℝ) := by
  sorry

end Erdos854
