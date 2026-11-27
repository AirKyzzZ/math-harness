import Mathlib

open Filter Real

namespace Erdos200

noncomputable def longestPrimeArithmeticProgressions (n : ℕ) : ℕ :=
  sSup {(k : ℕ) | ∃ s ⊆ Set.Icc 1 n, s.IsAPOfLength k ∧ ∀ m ∈ s, m.Prime}

theorem erdos_200.variants.upper :
    ∃ (o : ℕ → ℝ) (_ : o =o[atTop] (1 : ℕ → ℝ)), ∀ n, longestPrimeArithmeticProgressions n ≤ (1 + o n) * log n := by
  sorry

end Erdos200
