import Mathlib

open Filter Asymptotics AdditiveCombinatorics Set

namespace Erdos764

noncomputable def tripleRep (A : Set ℕ) : ℕ → ℕ := 𝟙_A ∗ 𝟙_A ∗ 𝟙_A

theorem erdos_764_neg :
    ¬ (¬ ∃ (A : Set ℕ) (c : ℝ), 0 < c ∧ (fun N : ℕ ↦ (∑ n ∈ Finset.range (N + 1), tripleRep A n : ℝ) - c * N) =O[atTop] fun _ ↦ (1 : ℝ)) := by
  sorry

end Erdos764
