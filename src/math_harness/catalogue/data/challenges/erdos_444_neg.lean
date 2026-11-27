import Mathlib

open Filter Finset

namespace Erdos444

open scoped Classical in
noncomputable def divisorCount (A : Set ℕ) (n : ℕ) : ℕ :=
  #{a ∈ n.divisors | a ∈ A}

theorem divisorCount_zero (A : Set ℕ) : divisorCount A 0 = 0 := by
  simp [divisorCount]

theorem divisorCount_zero_two_three_four_twelve : divisorCount {0, 2, 3, 4} 12 = 3 := by
  simp [divisorCount, show Nat.divisors 12 = {1, 2, 3, 4, 6, 12} by decide, filter_insert]

open scoped Classical in
theorem erdos_444_neg :
    ¬ (∀ A : Set ℕ, A.Infinite → ∀ k : ℕ, atTop.limsup (fun x : ℝ ↦ (((Ico 1 ⌈x⌉₊).sup (divisorCount A) / (∑ n ∈ Ico 1 ⌈x⌉₊ with n ∈ A, (n : ℝ)⁻¹) ^ k : ℝ) : EReal)) = ⊤) := by
  sorry

end Erdos444
