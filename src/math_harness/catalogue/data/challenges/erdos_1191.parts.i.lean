import Mathlib

open Filter Real

namespace Erdos1191

theorem erdos_1191.parts.i :
    ∀ A : Set ℕ, A.Infinite → IsSidon A → liminf (fun x : ℕ ↦ ENNReal.ofReal ((A ∩ .Icc 1 x).ncard / (x : ℝ) ^ (1 / 2 : ℝ) * log x ^ (1 / 2 : ℝ))) atTop = 0 := by
  sorry

end Erdos1191
