import Mathlib

open Filter Asymptotics

namespace Erdos792

noncomputable def f (n : ℕ) : ℕ :=
  sSup {m : ℕ |
    ∀ A : Finset ℤ, A.card = n →
      ∃ B : Finset ℤ,
        B ⊆ A ∧ IsSumFree (B : Set ℤ) ∧ m ≤ B.card}

theorem f_one : f 1 = 0 := by
  apply Nat.eq_zero_of_le_zero
  unfold f
  apply csSup_le
  · -- The empty subset shows that zero is a valid guarantee.
    refine ⟨0, ?_⟩
    intro A _
    refine ⟨∅, ?_, ?_, ?_⟩
    · exact Finset.empty_subset A
    · simp [IsSumFree]
    · simp
  · -- Apply the guarantee to {0}, whose only sum-free subset is empty.
    intro m h_guarantee
    obtain ⟨B, h_subset, h_sum_free, h_size⟩ := h_guarantee {0} (by simp)
    have h_cases : B = ∅ ∨ B = {0} :=
      Finset.subset_singleton_iff.mp h_subset
    rcases h_cases with h_empty | h_zero
    · rw [h_empty] at h_size
      simpa using h_size
    · -- But {0} is not sum-free: 0 + 0 = 0.
      rw [h_zero] at h_sum_free
      simp [isSumFree_iff] at h_sum_free

theorem not_isSumFree_one_two : ¬ IsSumFree ({1, 2} : Set ℤ) := by
  rw [isSumFree_iff]
  norm_num

theorem isSumFree_one_three : IsSumFree ({1, 3} : Set ℤ) := by
  rw [isSumFree_iff]
  norm_num

theorem erdos_792.variants.alon_kleitman (A : Finset ℤ) (h_positive : ∀ a ∈ A, 0 < a) (h_card : 3 ≤ A.card) :
    ∃ B ⊆ A, IsSumFree (B : Set ℤ) ∧ A.card + 1 ≤ 3 * B.card := by
  sorry

theorem erdos_792.variants.bourgain_implies_alon_kleitman :
    type_of% erdos_792.variants.bourgain →
    type_of% erdos_792.variants.alon_kleitman := by
  intro h A h_positive h_card
  obtain ⟨B, h_subset, h_sum_free, h_size⟩ := h A h_positive h_card
  refine ⟨B, h_subset, h_sum_free, ?_⟩
  omega

end Erdos792
