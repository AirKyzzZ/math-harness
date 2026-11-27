import Mathlib

namespace Erdos462

open Filter

open scoped BigOperators

theorem erdos_462_neg :
    ¬ (∃ C c : ℝ, 0 < C ∧ 0 < c ∧ ∀ᶠ x : ℕ in atTop, c ≤ ∑ n ∈ Finset.Icc x ⌊(x : ℝ) + C * Real.sqrt x * (Real.log x) ^ 2⌋₊, (n.minFac : ℝ) / n) := by
  sorry

end Erdos462
