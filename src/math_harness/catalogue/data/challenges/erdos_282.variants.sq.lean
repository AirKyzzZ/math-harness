import Mathlib

open Filter Real

namespace Erdos282

noncomputable def greedyUnitFractionRem (A : Set ℕ) (x : ℚ) (t : ℕ) : ℚ :=
  if x ≤ 0 then 0 else
    let n := sInf { n | n ∈ A ∧ 1 / x ≤ n }
    let rem := x - 1 / n
    match t with
    | 0 => rem
    | t + 1 => greedyUnitFractionRem (A \ {n}) rem t

theorem greedyUnitFractionRem_zero (n : ℕ) : greedyUnitFractionRem .univ (1 / n) 0 = 0 := by
  simp [greedyUnitFractionRem, Set.Ici_def]

theorem greedyUnitFractionRem_one (n : ℕ) : greedyUnitFractionRem .univ (1 / n) 1 = 0 := by
  simp [greedyUnitFractionRem, Set.Ici_def]

theorem greedyUnitFractionRem_sq_one : greedyUnitFractionRem { n | IsSquare n } 1 0 = 0 := by
  have : sInf {n : ℕ | IsSquare n ∧ 1 ≤ n} = 1 := IsLeast.csInf_eq <| by decide
  aesop (add simp [greedyUnitFractionRem])

theorem erdos_282.variants.sq :
    ∀ x : ℚ, (x : ℝ) ∈ Set.Ico 0 (π ^ 2 / 6 - 1) ∪ Set.Ico 1 (π ^ 2 / 6) → greedyUnitFractionRem { n | IsSquare n } x =ᶠ[atTop] 0 := by
  sorry

end Erdos282
