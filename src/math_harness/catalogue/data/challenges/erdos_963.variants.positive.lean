import Mathlib

open Filter Asymptotics

namespace Erdos963

noncomputable def f (n : ℕ) : ℕ :=
  sSup {k : ℕ | ∀ A : Finset ℝ, A.card = n →
    ∃ B ⊆ A, k ≤ B.card ∧ AddDissociated (B : Set ℝ)}

theorem le_f {n k : ℕ}
    (h : ∀ A : Finset ℝ, A.card = n → ∃ B ⊆ A, k ≤ B.card ∧ AddDissociated (B : Set ℝ)) :
    k ≤ f n := by
  refine le_csSup ⟨n, fun m hm ↦ ?_⟩ h
  obtain ⟨A, hA⟩ := Infinite.exists_subset_card_eq ℝ n
  obtain ⟨B, hBA, hmB, -⟩ := hm A hA
  exact hmB.trans ((Finset.card_le_card hBA).trans hA.le)

theorem f_le {n m : ℕ} (A : Finset ℝ) (hA : A.card = n)
    (h : ∀ B ⊆ A, AddDissociated (B : Set ℝ) → B.card ≤ m) : f n ≤ m := by
  refine csSup_le ⟨0, fun A' _ ↦ ⟨∅, Finset.empty_subset _, Nat.zero_le _, by simp⟩⟩ ?_
  intro k hk
  obtain ⟨B, hBA, hkB, hB⟩ := hk A hA
  exact hkB.trans (h B hBA hB)

section Greedy

private noncomputable def signedSums (B : Finset ℝ) : Finset ℝ :=
  (Fintype.piFinset fun _ : B ↦ ({-1, 0, 1} : Finset ℝ)).image fun ε ↦ ∑ b : B, ε b * b

private lemma card_signedSums_le (B : Finset ℝ) : (signedSums B).card ≤ 3 ^ B.card := by
  refine Finset.card_image_le.trans ?_
  rw [Fintype.card_piFinset]
  refine (Finset.prod_le_pow_card _ _ 3 fun _ _ ↦ Finset.card_le_three).trans ?_
  simp

private lemma sum_sub_sum_mem_signedSums {B t u : Finset ℝ} (ht : t ⊆ B) (hu : u ⊆ B) :
    ∑ x ∈ u, x - ∑ x ∈ t, x ∈ signedSums B := by
  classical
  refine Finset.mem_image.2 ⟨fun b ↦ (if (b : ℝ) ∈ u then 1 else 0) - if (b : ℝ) ∈ t then 1 else 0,
    Fintype.mem_piFinset.2 fun b ↦ ?_, ?_⟩
  · split_ifs <;> simp
  · simp only [sub_mul, ite_mul, one_mul, zero_mul, Finset.sum_sub_distrib]
    rw [Finset.sum_coe_sort B fun x ↦ if x ∈ u then x else 0,
      Finset.sum_coe_sort B fun x ↦ if x ∈ t then x else 0, Finset.sum_ite_mem,
      Finset.sum_ite_mem, Finset.inter_eq_right.2 hu, Finset.inter_eq_right.2 ht]

private lemma mem_signedSums_of_mem {B t u : Finset ℝ} {a : ℝ} (ht : t ⊆ insert a B)
    (hu : u ⊆ insert a B) (htu : Disjoint t u) (hsum : ∑ x ∈ t, x = ∑ x ∈ u, x) (ha : a ∈ t) :
    a ∈ signedSums B := by
  classical
  have h := sum_sub_sum_mem_signedSums (Finset.subset_insert_iff.1 ht)
    ((Finset.subset_insert_iff_of_notMem (Finset.disjoint_left.1 htu ha)).1 hu)
  rwa [← hsum, ← Finset.add_sum_erase t _ ha, add_sub_cancel_right] at h

end Greedy

theorem erdos_963.variants.greedy (n : ℕ) : Nat.log 3 n ≤ f n := by
  classical
  refine le_f fun A hA ↦ ?_
  -- Take a maximal dissociated subset `B` of `A`.
  obtain ⟨B, hB⟩ :=
    (A.powerset.filter fun B : Finset ℝ ↦ AddDissociated (B : Set ℝ)).exists_maximal
      ⟨∅, Finset.mem_filter.2 ⟨Finset.empty_mem_powerset _, by simp⟩⟩
  simp only [Finset.mem_filter, Finset.mem_powerset] at hB
  -- Every element of `A` is a signed sum of `B`.
  have hAB : A ⊆ signedSums B := by
    intro a ha
    by_cases haB : a ∈ B
    · simpa using
        sum_sub_sum_mem_signedSums (Finset.empty_subset B) (Finset.singleton_subset_iff.2 haB)
    obtain ⟨t, u, ht, hu, htu, hne, hsum⟩ := not_addDissociated_iff_exists_disjoint.1 fun h ↦
      hB.not_gt ⟨Finset.insert_subset_iff.2 ⟨ha, hB.1.1⟩, h⟩ <| Finset.ssubset_insert haB
    rw [Finset.coe_subset] at ht hu
    by_cases hat : a ∈ t
    · exact mem_signedSums_of_mem ht hu htu hsum hat
    by_cases hau : a ∈ u
    · exact mem_signedSums_of_mem hu ht htu.symm hsum.symm hau
    rw [Finset.subset_insert_iff_of_notMem hat] at ht
    rw [Finset.subset_insert_iff_of_notMem hau] at hu
    exact absurd (hB.1.2 (Finset.coe_subset.2 ht) (Finset.coe_subset.2 hu) hsum) hne
  refine ⟨B, hB.1.1, ?_, hB.1.2⟩
  calc Nat.log 3 n = Nat.log 3 A.card := by rw [hA]
    _ ≤ Nat.log 3 (3 ^ B.card) :=
        Nat.log_mono_right ((Finset.card_le_card hAB).trans (card_signedSums_le B))
    _ = B.card := Nat.log_pow (by norm_num) _

theorem erdos_963.variants.positive :
    ∀ A : Finset ℝ, (∀ a ∈ A, 0 < a) → ∃ B ⊆ A, Nat.log 2 A.card ≤ B.card ∧ AddDissociated (B : Set ℝ) := by
  sorry

end Erdos963
