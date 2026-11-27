import Mathlib

namespace Erdos693

open Filter

def divisorWindowSet (k n : ℕ) : Finset ℕ :=
  (Finset.Icc n (n ^ k)).filter fun x ↦
    ((Finset.Ioo n (2 * n)).filter fun d ↦ d ∣ x).Nonempty

def ConsecutiveIn (A : Finset ℕ) (x y : ℕ) : Prop :=
  x ∈ A ∧ y ∈ A ∧ x < y ∧
    ∀ z, z ∈ A → x < z → z < y → False

def MaxGapAtMost (A : Finset ℕ) (B : ℝ) : Prop :=
  ∀ x y, ConsecutiveIn A x y → (y - x : ℝ) ≤ B

theorem divisorWindowSet_two_two : divisorWindowSet 2 2 = {3} := by
  rfl

theorem divisorWindowSet_two_three : divisorWindowSet 2 3 = {4, 5, 8} := by
  decide +kernel

theorem maxGapAtMost_two_three :
    MaxGapAtMost (divisorWindowSet 2 3) 3 ∧
      ¬ MaxGapAtMost (divisorWindowSet 2 3) 2 := by
  rw [divisorWindowSet_two_three]
  norm_num [MaxGapAtMost, ConsecutiveIn]
  rintro x y (rfl | rfl | rfl) (rfl | rfl | rfl) <;> norm_num

theorem erdos_693 :
    ∃ C : ℕ, ∀ k ≥ 2, ∀ᶠ n in atTop, MaxGapAtMost (divisorWindowSet k n) ((Real.log (n : ℝ)) ^ C) := by
  sorry

end Erdos693
