import Mathlib

namespace Erdos729

theorem erdos_729 :
    ∀ (C : ℝ) (hC : C > 0), ∃ K ≥ 3, Set.Infinite { T : ℕ × ℕ × ℕ | let (a, b, n) := T a > 0 ∧ b > 0 ∧ n > 0 ∧ (a : ℝ) + b > n + C * Real.log n ∧ ∀ p, p.Prime → p > K → padicValNat p ((n.factorial / (a.factorial * b.factorial) : ℚ).den) = 0 } := by
  sorry

end Erdos729
