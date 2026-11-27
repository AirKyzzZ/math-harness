import Mathlib

open Filter Asymptotics AdditiveCombinatorics

namespace Erdos763

theorem erdos_763.variants.montgomery_vaughan :
    ¬ ∃ (A : Set ℕ) (c : ℝ), 0 < c ∧ (fun N : ℕ ↦ (∑ n ∈ Finset.range (N + 1), sumRep A n : ℝ) - c * N) =o[atTop] fun N ↦ (N : ℝ) ^ (1 / 4 : ℝ) := by
  sorry

end Erdos763
