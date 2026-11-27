import Mathlib

namespace Erdos1149

theorem erdos_1149 (α : ℝ) (hα : 0 < α) (hα' : α ∉ Set.range ((↑) : ℤ → ℝ)) :
    {n : ℕ | 1 ≤ n ∧ n.Coprime ⌊(n : ℝ) ^ α⌋₊}.HasDensity (6 / Real.pi ^ 2) := by
  sorry

end Erdos1149
