import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos1088

variable {d : ℕ}

def PairwiseDistancesDistinct (A : Finset (ℝ^d)) : Prop :=
  distinctDistances A = Nat.choose A.card 2

def HasSubsetWithDistinctDistances (n : ℕ) (S : Finset (ℝ^d)) : Prop :=
  ∃ A : Finset (ℝ^d), A ⊆ S ∧ A.card = n ∧ PairwiseDistancesDistinct A

def cardSet (d n : ℕ) : Set ℕ :=
  { m | n ≤ m ∧ ∀ S : Finset (ℝ^d), S.card = m → HasSubsetWithDistinctDistances n S }

noncomputable def f (d n : ℕ) : ℕ := sInf (cardSet d n)

theorem erdos_1088 :
    ∀ n ≥ 3, (fun d : ℕ ↦ Real.logb 2 (f d n : ℝ)) =o[atTop] (fun d : ℕ ↦ (d : ℝ)) := by
  sorry

end Erdos1088
