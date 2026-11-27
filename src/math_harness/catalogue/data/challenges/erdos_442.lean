import Mathlib

namespace Erdos442

open Filter Set Erdos442

open scoped Topology

section Prelims

noncomputable def Real.maxLogOne (x : ℝ) := max x.log 1

namespace Set

variable (A : Set ℕ) (x : ℝ)

@[inline]
abbrev bddProdUpper : Set (ℕ × ℕ) :=
  {y ∈ (A ∩ Icc 1 ⌊x⌋₊) ×ˢ (A ∩ Icc 1 ⌊x⌋₊) | y.fst < y.snd}

noncomputable instance : Fintype (A.bddProdUpper x) :=
  (((Set.finite_Icc 1 ⌊x⌋₊).prod (Set.finite_Icc 1 ⌊x⌋₊)).subset <| by grind).fintype

noncomputable instance : Fintype (A ∩ Icc 1 ⌊x⌋₊ : Set ℕ) :=
  ((Set.finite_Icc 1 ⌊x⌋₊).subset Set.inter_subset_right).fintype

end Set

end Prelims

theorem erdos_442 :
    ¬ ∀ (A : Set ℕ), Tendsto (fun (x : ℝ) => 1 / x.maxLogOne.maxLogOne * ∑ n ∈ (A ∩ Icc 1 ⌊x⌋₊ : Set ℕ), (1 : ℝ) / n) atTop atTop → Tendsto (fun (x : ℝ) => 1 / (∑ n ∈ (A ∩ Icc 1 ⌊x⌋₊ : Set ℕ), (1 : ℝ) / n) ^ 2 * ∑ nm ∈ A.bddProdUpper x, (1 : ℝ) / nm.1.lcm nm.2) atTop atTop := by
  sorry

end Erdos442
