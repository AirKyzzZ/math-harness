import Mathlib

open Filter Topology

namespace Erdos391

noncomputable def t (n : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ a : Fin n → ℕ, ∏ i, a i = n.factorial ∧ ∀ i, k ≤ a i}

theorem erdos_391.variants.deficit :
    ∃ c : ℝ, 0 < c ∧ {n : ℕ | (t n : ℝ) / n ≤ 1 / Real.exp 1 - c / Real.log n}.Infinite := by
  sorry

end Erdos391
