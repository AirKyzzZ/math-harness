import Mathlib

open Filter Asymptotics AdditiveCombinatorics

namespace Erdos763

theorem erdos_763.variants.erdos_fuchs :
    ¬ ∃ (A : Set ℕ) (c : ℝ), 0 < c ∧ (fun N : ℕ ↦ (∑ n ∈ Finset.range (N + 1), sumRep A n : ℝ) - c * N) =o[atTop] fun N ↦ (N : ℝ) ^ (1 / 4 : ℝ) / √(Real.log N) := by
  sorry

end Erdos763
