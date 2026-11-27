import Mathlib

namespace Erdos30

noncomputable abbrev h (N : ℕ) : ℕ := Finset.maxSidonSubsetCard (Finset.Icc 1 N)

open Filter

open scoped Asymptotics Pointwise

theorem erdos_30.variants.O_one_neg :
    ¬ ((fun N => h N - (N : ℝ).sqrt) =O[atTop] fun _ => (1 : ℝ)) := by
  sorry

theorem erdos_30.variants.elementary_difference_count (A : Finset ℕ) (N : ℕ)
    (hS : IsSidon (A : Set ℕ)) (hA : A ⊆ Finset.range (N + 1)) :
    A.card * (A.card - 1) ≤ 2 * N := by
  have h_inj : Set.InjOn (fun p : ℕ × ℕ ↦ p.1 - p.2)
      (({p ∈ A ×ˢ A | p.2 < p.1} : Finset (ℕ × ℕ)) : Set (ℕ × ℕ)) := by
    intro ⟨a₁, b₁⟩ h₁ ⟨a₂, b₂⟩ h₂ heq
    simp only [Finset.mem_coe, Finset.mem_filter, Finset.mem_product] at h₁ h₂
    have := Finset.IsSidon.eq_of_tsub hS h₁.1.1 h₁.1.2 h₂.1.1 h₂.1.2 h₁.2 h₂.2 heq
    exact Prod.ext this.1 this.2
  have h_sub : {p ∈ A ×ˢ A | p.2 < p.1}.image (fun p : ℕ × ℕ ↦ p.1 - p.2) ⊆ Finset.Icc 1 N := by
    simp only [Finset.image_subset_iff, Finset.mem_filter, Finset.mem_product, Finset.mem_Icc,
      and_imp, Prod.forall]
    intro a b ha _ hlt
    have := Finset.mem_range.mp (hA ha)
    lia
  have := Finset.card_le_card h_sub
  rw [Finset.card_image_of_injOn h_inj, Nat.card_Icc] at this
  have := Finset.two_mul_card_product_filter_gt A
  lia

theorem erdos_30.variants.distinct_sums_card (A : Finset ℕ) (hS : IsSidon (A : Set ℕ)) :
    (A + A).card = A.card * (A.card + 1) / 2 := by
  rw [Set.isSidon_iff_le] at hS
  have hAA : A + A = {p ∈ A ×ˢ A | p.1 ≤ p.2}.image (fun p ↦ p.1 + p.2) := by
    ext x
    simp only [Finset.mem_add, Finset.mem_image, Finset.mem_filter, Finset.mem_product, Prod.exists]
    constructor
    · rintro ⟨a, ha, b, hb, rfl⟩
      rcases le_total a b with hab | hba
      · exact ⟨a, b, ⟨⟨ha, hb⟩, hab⟩, rfl⟩
      · exact ⟨b, a, ⟨⟨hb, ha⟩, hba⟩, add_comm b a⟩
    · rintro ⟨a, b, ⟨⟨ha, hb⟩, _⟩, rfl⟩
      exact ⟨a, ha, b, hb, rfl⟩
  have h_inj : Set.InjOn (fun p : ℕ × ℕ ↦ p.1 + p.2)
      (({p ∈ A ×ˢ A | p.1 ≤ p.2} : Finset (ℕ × ℕ)) : Set (ℕ × ℕ)) := by
    intro ⟨a₁, b₁⟩ h₁ ⟨a₂, b₂⟩ h₂ heq
    simp only [Finset.mem_coe, Finset.mem_filter, Finset.mem_product] at h₁ h₂
    have := hS a₁ h₁.1.1 b₁ h₁.1.2 a₂ h₂.1.1 b₂ h₂.1.2 h₁.2 h₂.2 heq
    exact Prod.ext this.1 this.2
  have h_split : {p ∈ A ×ˢ A | p.1 ≤ p.2} = {p ∈ A ×ˢ A | p.1 < p.2} ∪ A.diag := by
    rw [Finset.diag_eq_filter]
    simp [le_iff_lt_or_eq, Finset.filter_or]
  have h_disj : Disjoint {p ∈ A ×ˢ A | p.1 < p.2} A.diag := by
    rw [Finset.diag_eq_filter]
    exact Finset.disjoint_filter.2 fun _ _ h₁ h₂ ↦ absurd h₂ h₁.ne
  have h_tri := Finset.two_mul_card_product_filter_lt A
  have h_le : A.card ≤ A.card * A.card := Nat.le_mul_self _
  rw [Nat.mul_sub_one] at h_tri
  rw [hAA, Finset.card_image_of_injOn h_inj, h_split, Finset.card_union_of_disjoint h_disj,
    Finset.diag_card, mul_add_one]
  lia

theorem erdos_30.variants.distinct_sums_in_range (A : Finset ℕ) (N : ℕ)
    (hA : A ⊆ Finset.range (N + 1)) :
    A + A ⊆ Finset.range (2 * N + 1) := by
  grw [hA, Finset.range_add_range]
  simp [two_mul]

theorem erdos_30.variants.erdos_turan_counting (A : Finset ℕ) (N : ℕ)
    (hS : IsSidon (A : Set ℕ)) (hA : A ⊆ Finset.range (N + 1)) :
    A.card * (A.card + 1) / 2 ≤ 2 * N + 1 := by
  rw [← erdos_30.variants.distinct_sums_card A hS]
  simpa using Finset.card_le_card (erdos_30.variants.distinct_sums_in_range A N hA)

theorem erdos_30.variants.lindstrom_weak (A : Finset ℕ) (N : ℕ)
    (hS : IsSidon (A : Set ℕ)) (hA : A ⊆ Finset.range (N + 1)) :
    A.card ≤ Nat.sqrt (2 * N) + 1 := by
  have h := erdos_30.variants.elementary_difference_count A N hS hA
  have : (A.card - 1) * (A.card - 1) ≤ 2 * N := (Nat.mul_le_mul_right _ (Nat.sub_le _ _)).trans h
  have := Nat.le_sqrt.mpr this
  lia

end Erdos30
