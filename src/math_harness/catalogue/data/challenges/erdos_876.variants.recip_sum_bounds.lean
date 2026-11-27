import Mathlib

open Filter

namespace Erdos876

def IsSubsetSumFree (A : Set ℕ) : Prop :=
  ∀ a ∈ A, 0 < a ∧ a ∉ subsetSums (A ∩ Set.Iio a)

noncomputable def gap (A : Set ℕ) (n : ℕ) : ℕ :=
  Nat.nth (· ∈ A) n - Nat.nth (· ∈ A) (n - 1)

noncomputable def maxRecipSum : ℝ :=
  sSup {s : ℝ | ∃ A : Set ℕ, A.Infinite ∧ IsSubsetSumFree A ∧
    HasSum (fun a : A ↦ (1 : ℝ) / (a : ℕ)) s}

theorem not_isSubsetSumFree_one_two_three : ¬ IsSubsetSumFree ({1, 2, 3} : Set ℕ) := by
  intro h
  refine (h 3 (by simp)).2 ⟨{1, 2}, ?_, by decide⟩
  intro x hx
  simp at hx
  rcases hx with rfl | rfl <;> simp

theorem erdos_876.variants.recip_sum_bounds :
    2.064 < maxRecipSum ∧ maxRecipSum < 4 := by
  sorry

end Erdos876
