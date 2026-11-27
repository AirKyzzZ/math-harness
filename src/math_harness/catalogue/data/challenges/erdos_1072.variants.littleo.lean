import Mathlib

open Nat Filter Finset Set

open scoped Topology

namespace Erdos1072

noncomputable def f (p : ℕ) : ℕ := sInf {n | (n)! + 1 ≡ 0 [MOD p]}

theorem erdos_1072.variants.littleo :
    (fun x ↦ (({p | p.Prime ∧ f p = p - 1} ∩ Icc 0 x).ncard : ℝ)) =o[atTop] (fun x ↦ x / Real.log x) := by
  sorry

end Erdos1072
