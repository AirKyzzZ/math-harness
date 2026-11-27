import Mathlib

open Filter Asymptotics AdditiveCombinatorics Set

namespace Erdos764

noncomputable def tripleRep (A : Set ℕ) : ℕ → ℕ := 𝟙_A ∗ 𝟙_A ∗ 𝟙_A

theorem erdos_764.variants.vaughan :
    ¬ ∃ (A : Set ℕ) (c : ℝ), 0 < c ∧ (fun N : ℕ ↦ (∑ n ∈ Finset.range (N + 1), tripleRep A n : ℝ) - c * N) =o[atTop] fun N ↦ (N : ℝ) ^ (1 / 4 : ℝ) / √(Real.log N) := by
  sorry

end Erdos764
