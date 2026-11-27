import Mathlib

open Nat Filter Asymptotics Real Set

namespace Erdos1138

abbrev snd_gt_half_fst : Filter (ℝ × ℝ) := atTop.comap Prod.fst ⊓ 𝓟 {p | p.2 ∈ Ioo (p.1 / 2) p.1}

noncomputable def primeCount_Ioc_mul_const (C : ℝ) : (ℝ × ℝ) → ℝ :=
  fun (x, y) ↦ (primeCounting ⌊y + C * sup_primeGap x⌋₊ - primeCounting ⌊y⌋₊)

theorem erdos_1138 :
    ¬ ∀C > 1, primeCount_Ioc_mul_const C ~[snd_gt_half_fst] fun (x, y) ↦ C * (sup_primeGap x) / Real.log y := by
  sorry

end Erdos1138
