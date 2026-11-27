import Mathlib

open Filter Asymptotics AdditiveCombinatorics

namespace Erdos763

theorem erdos_763_neg :
    ¬ (¬ ∃ (A : Set ℕ) (c : ℝ), 0 < c ∧ (fun N : ℕ ↦ (∑ n ∈ Finset.range (N + 1), sumRep A n : ℝ) - c * N) =O[atTop] fun _ ↦ (1 : ℝ)) := by
  sorry

end Erdos763
