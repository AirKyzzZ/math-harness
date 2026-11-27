import Mathlib

open scoped Topology

open Filter

namespace Erdos36

def Overlap (A B : Finset ℤ) (k : ℤ) : ℕ := ((A.product B).filter <| fun (a, b) => a - b = k).card

noncomputable def MaxOverlap (A B : Finset ℤ) : ℕ := iSup <| Overlap A B

noncomputable def M (n : ℕ) : ℕ :=
  sInf {MaxOverlap A B | (A : Finset ℤ) (B : Finset ℤ)
    (_disjoint : Disjoint A B)
    (_union : A ∪ B = Finset.Icc (1 : ℤ) (2 * n))
    (_same_card : A.card = B.card)}

private lemma one_le_overlap {A B : Finset ℤ} {a b : ℤ}
    (ha : a ∈ A) (hb : b ∈ B) : 1 ≤ Overlap A B (a - b) :=
  Finset.card_pos.mpr ⟨(a, b), Finset.mem_filter.mpr
    ⟨Finset.mem_product.mpr ⟨ha, hb⟩, rfl⟩⟩

private lemma overlap_le_card_left (A B : Finset ℤ) (k : ℤ) : Overlap A B k ≤ A.card := by
  refine Finset.card_le_card_of_injOn Prod.fst (fun p hp => ?_) (fun p hp q hq h => ?_)
  · exact (Finset.mem_product.mp (Finset.mem_filter.mp hp).1).1
  · obtain ⟨-, hpk⟩ := Finset.mem_filter.mp hp
    obtain ⟨-, hqk⟩ := Finset.mem_filter.mp hq
    exact Prod.ext h (by omega)

private lemma bddAbove_range_overlap (A B : Finset ℤ) :
    BddAbove (Set.range (Overlap A B)) := by
  refine ⟨A.card, ?_⟩
  rintro x ⟨k, rfl⟩
  exact overlap_le_card_left A B k

private lemma maxOverlap_le_card_left (A B : Finset ℤ) : MaxOverlap A B ≤ A.card :=
  ciSup_le fun k => overlap_le_card_left A B k

private lemma overlap_eq_zero_of_notMem_sub (A B : Finset ℤ) {k : ℤ}
    (hk : k ∉ (A ×ˢ B).image fun p => p.1 - p.2) : Overlap A B k = 0 := by
  rw [Overlap, Finset.card_eq_zero, Finset.filter_eq_empty_iff]
  rintro ⟨a, b⟩ hab rfl
  exact hk (Finset.mem_image.mpr ⟨(a, b), hab, rfl⟩)

private lemma maxOverlap_eq_sup (A B : Finset ℤ) :
    MaxOverlap A B = ((A ×ˢ B).image fun p => p.1 - p.2).sup (Overlap A B) := by
  refine le_antisymm (ciSup_le fun k => ?_) (Finset.sup_le fun k _ => ?_)
  · by_cases hk : k ∈ (A ×ˢ B).image fun p => p.1 - p.2
    · exact Finset.le_sup hk
    · simp [overlap_eq_zero_of_notMem_sub A B hk]
  · exact le_ciSup (bddAbove_range_overlap A B) k

private lemma M_eq_image (n : ℕ) :
    M n = sInf ((fun A : Finset ℤ => MaxOverlap A (Finset.Icc (1 : ℤ) (2 * n) \ A)) ''
      {A | A ⊆ Finset.Icc (1 : ℤ) (2 * n) ∧ A.card = n}) := by
  rw [M]
  congr 1
  ext m
  constructor
  · rintro ⟨A, B, hdisj, hunion, hcard, rfl⟩
    have hA : A ⊆ Finset.Icc (1 : ℤ) (2 * n) := hunion ▸ Finset.subset_union_left
    have hB : B = Finset.Icc (1 : ℤ) (2 * n) \ A := by
      rw [← hunion, Finset.union_sdiff_cancel_left hdisj]
    have hn : A.card = n := by
      have := Finset.card_union_of_disjoint hdisj
      rw [hunion] at this
      simp only [Int.card_Icc] at this
      omega
    exact ⟨A, ⟨hA, hn⟩, by simp only [← hB]⟩
  · rintro ⟨A, ⟨hA, hn⟩, rfl⟩
    refine ⟨A, Finset.Icc (1 : ℤ) (2 * n) \ A, Finset.disjoint_sdiff, ?_, ?_, rfl⟩
    · rw [Finset.union_sdiff_of_subset hA]
    · rw [Finset.card_sdiff, Finset.inter_eq_left.mpr hA, Int.card_Icc, hn]
      omega

private def maxOverlapC (A B : Finset ℤ) : ℕ :=
  ((A ×ˢ B).image fun p => p.1 - p.2).sup (Overlap A B)

private lemma maxOverlap_eq_maxOverlapC (A B : Finset ℤ) :
    MaxOverlap A B = maxOverlapC A B := maxOverlap_eq_sup A B

private def parts (n : ℕ) : Finset (Finset ℤ) :=
  letI : Preorder ℤ := Int.instLinearOrder.toPreorder
  (Finset.Icc (1 : ℤ) (2 * n)).powerset.filter fun A => A.card = n

private lemma mem_parts {n : ℕ} {A : Finset ℤ} :
    A ∈ parts n ↔ A ⊆ Finset.Icc (1 : ℤ) (2 * n) ∧ A.card = n := by
  simp [parts, Finset.mem_filter, Finset.mem_powerset]

private lemma parts_nonempty (n : ℕ) : (parts n).Nonempty := by
  refine ⟨Finset.Icc (1 : ℤ) n, mem_parts.mpr ⟨?_, ?_⟩⟩
  · exact Finset.Icc_subset_Icc le_rfl (by omega)
  · rw [Int.card_Icc]; omega

private lemma M_eq_min' (n : ℕ) :
    M n = ((parts n).image fun A => maxOverlapC A (Finset.Icc (1 : ℤ) (2 * n) \ A)).min'
      ((parts_nonempty n).image _) := by
  rw [M_eq_image, ← Finset.Nonempty.csInf_eq_min']
  congr 1
  rw [Finset.coe_image,
    show ((parts n : Finset (Finset ℤ)) : Set (Finset ℤ))
        = {A | A ⊆ Finset.Icc (1 : ℤ) (2 * n) ∧ A.card = n} from by ext A; simp [mem_parts]]
  exact Set.image_congr fun A _ => maxOverlap_eq_maxOverlapC _ _

private lemma maxOverlap_singleton_one_two :
    MaxOverlap ({1} : Finset ℤ) ({2} : Finset ℤ) = 1 := by
  apply le_antisymm
  · rw [show (1 : ℕ) = ({(1, 2)} : Finset (ℤ × ℤ)).card from by decide]
    refine ciSup_le ?_
    intro k
    apply Finset.card_le_card
    intro p hp
    obtain ⟨hp1, _⟩ := Finset.mem_filter.mp hp
    obtain ⟨ha, hb⟩ := Finset.mem_product.mp hp1
    simp only [Finset.mem_singleton] at ha hb
    exact Finset.mem_singleton.mpr (Prod.ext ha hb)
  · refine le_ciSup_of_le ?_ (-1) ?_
    · refine ⟨1, ?_⟩
      rintro x ⟨k, rfl⟩
      exact (Finset.card_filter_le _ _).trans (by decide)
    · decide

theorem M_one : M 1 = 1 := by
  apply le_antisymm
  · apply Nat.sInf_le
    refine ⟨{1}, {2}, by decide, by decide, by decide, maxOverlap_singleton_one_two⟩
  · apply le_csInf
    · exact ⟨_, {1}, {2}, by decide, by decide, by decide,
        maxOverlap_singleton_one_two⟩
    rintro x ⟨A, B, hd, hu, hsc, rfl⟩
    -- |A ∪ B| = 2 ∧ |A| = |B| ⇒ each is a singleton.
    have hcardsum : A.card + B.card = 2 := by
      rw [← Finset.card_union_of_disjoint hd, hu]; decide
    have hca : A.card = 1 := by omega
    have hcb : B.card = 1 := by omega
    obtain ⟨a, rfl⟩ := Finset.card_eq_one.mp hca
    obtain ⟨b, rfl⟩ := Finset.card_eq_one.mp hcb
    -- MaxOverlap ≥ Overlap at `k = a - b`, and that's ≥ 1.
    refine le_ciSup_of_le ?_ (a - b) ?_
    · refine ⟨1, ?_⟩
      rintro x ⟨k, rfl⟩
      refine (Finset.card_filter_le _ _).trans ?_
      rw [Finset.product_eq_sprod, Finset.card_product,
        Finset.card_singleton, Finset.card_singleton]
    · exact one_le_overlap (Finset.mem_singleton.mpr rfl)
        (Finset.mem_singleton.mpr rfl)

theorem M_two : M 2 = 1 := by
  rw [M_eq_min']
  decide

theorem M_three : M 3 = 2 := by
  rw [M_eq_min']
  decide

set_option maxRecDepth 8000 in
theorem M_four : M 4 = 2 := by
  rw [M_eq_min']
  decide

set_option maxRecDepth 40000 in
theorem M_five : M 5 = 3 := by
  rw [M_eq_min']
  decide

noncomputable def MinOverlapQuotient (N : ℕ) := (M N : ℝ) / N

theorem erdos_36.variants.exists :
    ∃ c, atTop.Tendsto MinOverlapQuotient (𝓝 c) ∧ c < 0.385694 := by
  sorry

end Erdos36
