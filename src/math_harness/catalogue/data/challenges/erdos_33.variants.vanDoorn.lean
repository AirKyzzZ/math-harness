import Mathlib

variable {α : Type} [AddCommMonoid α]

open Set

open scoped goldenRatio

namespace Erdos33

-- Formalisation note: Changed 'every large integer' to 'every integer' as for the statement these

-- conditions are equivalent. Also, this was the formulation in the original paper `by Erdos.

def AdditiveBasisCondition (A : Set ℕ) : Prop :=
  ∀ (k : ℕ), ∃ (n : ℕ) (a : ℕ), a ∈ A ∧ k = a + n^2

theorem erdos_33.variants.vanDoorn :
    ⨅ A : {A : Set ℕ | AdditiveBasisCondition A}, Filter.atTop.limsup (fun N => (A.1 ∩ Icc 1 N).ncard / (√N : EReal)) ≤ ↑(2 * (φ ^ ((5 : ℝ) / 2))) := by
  sorry

end Erdos33
