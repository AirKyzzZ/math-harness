import Mathlib

open Filter Real

namespace Erdos1191

theorem erdos_1191.parts.ii :
    ∃ A : Set ℕ, A.Infinite ∧ IsSidon A ∧ ∃ c > (0 : ℝ), 0 < liminf (fun x : ℕ ↦ ENNReal.ofReal ((A ∩ .Icc 1 x).ncard / (x : ℝ) ^ (1 / 2 : ℝ) * log x ^ c)) atTop := by
  sorry

end Erdos1191
