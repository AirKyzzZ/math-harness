import Mathlib

open Filter Real

namespace Erdos1191

theorem erdos_1191.variants.liminf_le {A : Set ℕ} (hAinf : A.Infinite) (hAsid : IsSidon A) :
    ∃ c > (0 : ℝ), liminf (fun x : ℕ ↦ ENNReal.ofReal ((A ∩ .Icc 1 x).ncard / (x : ℝ) ^ (1 / 2 : ℝ) * log x ^ (1 / 2 : ℝ))) atTop ≤ ENNReal.ofReal c := by
  sorry

end Erdos1191
