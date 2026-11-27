import Mathlib

open Filter Set

namespace Erdos41

variable {α : Type} [AddCommMonoid α]

def NtupleCondition (A : Set α) (n : ℕ) : Prop :=
  ∀ I J : Multiset α,
    (∀ i ∈ I, i ∈ A) →
    (∀ j ∈ J, j ∈ A) →
    I.card = n →
    J.card = n →
    I.sum = J.sum →
    I = J

theorem erdos_41 (A : Set ℕ) (h_triple : NtupleCondition A 3) (h_infinite : A.Infinite) :
    Filter.atTop.liminf (fun N => (A ∩ Icc 1 N).ncard / (N : ℝ)^(1/3 : ℝ)) = 0 := by
  sorry

end Erdos41
