import Mathlib

open Function Set

namespace Erdos707

theorem erdos_707.variants.prime_power : (∀ (A : Set ℕ) (h : A.Finite), IsSidon A →
    ∃ (B : Set ℕ) (p : ℕ), IsPrimePow p ∧ A ⊆ B ∧
    IsPerfectDifferenceSet B (p^2 + p + 1)) ↔ False := by
  simp
  sorry

theorem erdos_707.variants.counterexample_prime (A : Set ℕ) (hA : A = {1, 2, 4, 8}) :
    Finite A ∧ IsSidon A ∧ ∀ (B : Set ℕ) (p : ℕ), Prime p → A ⊆ B → ¬IsPerfectDifferenceSet B (p ^ 2 + p + 1) := by
  sorry

theorem erdos_707.variants.perfect_difference_set_size_bound (B : Set ℕ) (n : ℕ)
    (hB : IsPerfectDifferenceSet B n) : B.ncard ≤ n.sqrt + 1 := by
  by_cases hfin : B.Finite
  by_cases hn : n = 0
  subst hn; simp
  by_contra! h_abs
  exact ((hfin.offDiag.image _).subset hB.surjOn).not_infinite (by
    rw [show (0 : ZMod 0) = (0 : ℤ) from rfl]; exact (Set.finite_singleton (0 : ℤ)).infinite_compl)
  have : NeZero n := ⟨hn⟩
  suffices h : (B.ncard - 1) ^ 2 ≤ n by have := Nat.le_sqrt'.mpr h; omega
  lift B to Finset ℕ using hfin; simp
  have h_target : {x : ZMod n | x ≠ 0}.ncard ≤ n :=
    le_trans (Set.ncard_le_ncard (Set.subset_univ _) (Set.toFinite _))
    (by simp [Set.ncard_univ, Nat.card_eq_fintype_card, ZMod.card])
  have h_off_ncard_le : (↑B : Set ℕ).offDiag.ncard ≤ n := by
    have := hB.injOn.ncard_image
    rw [hB.image_eq] at this
    linarith [this, h_target]
  have h_off_le : B.offDiag.card ≤ n := by
    rwa [← Finset.coe_offDiag, ncard_coe_finset] at h_off_ncard_le
  have h_mul_eq : B.card * (B.card - 1) = B.offDiag.card := by
    rw [Finset.offDiag_card]; rcases B.card with _ | k <;> simp [Nat.succ_mul,
      Nat.mul_succ]
  have h_sq_le : (B.card - 1) ^ 2 ≤ B.card * (B.card - 1) := by
    rw [sq]; exact Nat.mul_le_mul_right _ (Nat.sub_le _ _)
  linarith [h_sq_le, h_mul_eq, h_off_le]
  have := Set.Infinite.ncard hfin; omega

theorem erdos_707.variants.example_sidon_set : IsSidon ({1, 2, 4} : Set ℕ) := by
  intro i₁ hi₁ j₁ hj₁ i₂ hi₂ j₂ hj₂ hsum
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hi₁ hj₁ hi₂ hj₂
  rcases hi₁ with rfl | rfl | rfl <;>
  rcases hj₁ with rfl | rfl | rfl <;>
  rcases hi₂ with rfl | rfl | rfl <;>
  rcases hj₂ with rfl | rfl | rfl <;>
  simp_all

theorem erdos_707.variants.example_embedding : ∃ (B : Set ℕ), {1, 2, 4} ⊆ B ∧
    IsPerfectDifferenceSet B 7 := by
  refine ⟨{1, 2, 4}, Set.Subset.refl _, ?_⟩
  unfold IsPerfectDifferenceSet
  refine ⟨?mapsTo, ?injOn, ?surjOn⟩
  · intro ⟨a, b⟩ hab; simp only [Set.mem_offDiag, Set.mem_insert_iff, Set.mem_singleton_iff] at hab
    obtain ⟨ha, hb, hne⟩ := hab
    simp only [Set.mem_ofPred]
    rcases ha with rfl | rfl | rfl <;>
    rcases hb with rfl | rfl | rfl <;>
    simp_all <;> decide
  · intro ⟨a₁, b₁⟩ h1 ⟨a₂, b₂⟩ h2 heq
    simp only [Set.mem_offDiag, Set.mem_insert_iff, Set.mem_singleton_iff] at h1 h2
    obtain ⟨ha1, hb1, hne1⟩ := h1; obtain ⟨ha2, hb2, hne2⟩ := h2
    rcases ha1 with rfl | rfl | rfl <;>
    rcases hb1 with rfl | rfl | rfl <;>
    rcases ha2 with rfl | rfl | rfl <;>
    rcases hb2 with rfl | rfl | rfl <;>
    simp_all (config := { decide := true })
  · intro x hx
    simp only [Set.mem_ofPred] at hx
    fin_cases x
    · exact absurd rfl hx
    · refine ⟨(2, 1), by simp [Set.mem_offDiag, Set.mem_insert_iff], by rfl⟩
    · refine ⟨(4, 2), by simp [Set.mem_offDiag, Set.mem_insert_iff], by rfl⟩
    · refine ⟨(4, 1), by simp [Set.mem_offDiag, Set.mem_insert_iff], by rfl⟩
    · refine ⟨(1, 4), by simp [Set.mem_offDiag, Set.mem_insert_iff], by rfl⟩
    · refine ⟨(2, 4), by simp [Set.mem_offDiag, Set.mem_insert_iff], by rfl⟩
    · refine ⟨(1, 2), by simp [Set.mem_offDiag, Set.mem_insert_iff], by rfl⟩

end Erdos707
