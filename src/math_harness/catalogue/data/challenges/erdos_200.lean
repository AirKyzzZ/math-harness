import Mathlib

open Filter Real

namespace Erdos200

noncomputable def longestPrimeArithmeticProgressions (n : ℕ) : ℕ :=
  sSup {(k : ℕ) | ∃ s ⊆ Set.Icc 1 n, s.IsAPOfLength k ∧ ∀ m ∈ s, m.Prime}

theorem erdos_200 :
    (fun n => (longestPrimeArithmeticProgressions n : ℝ)) =o[atTop] (fun n => log n) := by
  sorry

end Erdos200
