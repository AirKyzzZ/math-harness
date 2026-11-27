import Mathlib

open Finset BigOperators Filter Asymptotics

namespace Erdos423

def IsConsecutiveBlockSum (a : ℕ → ℕ) (k : ℕ) (m : ℕ) : Prop :=
  ∃ i j : ℕ, 1 ≤ i ∧ i + 1 ≤ j ∧ j + 1 ≤ k ∧
    m = ∑ l ∈ Finset.Icc i j, a l

def IsHofstadterSeq (a : ℕ → ℕ) : Prop :=
  a 1 = 1 ∧ a 2 = 2 ∧
  ∀ k : ℕ, 3 ≤ k →
    IsConsecutiveBlockSum a k (a k) ∧
    a (k - 1) < a k ∧
    ∀ m : ℕ, a (k - 1) < m → m < a k → ¬IsConsecutiveBlockSum a k m

theorem erdos_423.test.a3 : ∀ a : ℕ → ℕ, IsHofstadterSeq a → a 3 = 3 := by
  intro a ⟨ha1, ha2, hk⟩
  obtain ⟨⟨i, j, hi, hij, hjk, hsum⟩, _, _⟩ := hk 3 (by omega)
  have : i = 1 ∧ j = 2 := by omega
  obtain ⟨rfl, rfl⟩ := this
  simp only [show Finset.Icc 1 2 = {1, 2} from by decide,
    Finset.sum_pair (show (1 : ℕ) ≠ 2 from by decide), ha1, ha2] at hsum
  omega

theorem erdos_423.test.a4 : ∀ a : ℕ → ℕ, IsHofstadterSeq a → a 4 = 5 := by
  intro a ⟨ha1, ha2, hk⟩
  have ha3 : a 3 = 3 := erdos_423.test.a3 a ⟨ha1, ha2, hk⟩
  obtain ⟨⟨i, j, hi, hij, hjk, hsum⟩, hlt, hmin⟩ := hk 4 (by omega)
  -- Since `j ≤ 3`, the possible pairs `(i, j)` are `(1, 2)`, `(2, 3)`, and `(1, 3)`.
  have h_ij : (i = 1 ∧ j = 2) ∨ (i = 2 ∧ j = 3) ∨ (i = 1 ∧ j = 3) := by omega
  rcases h_ij with ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩ | ⟨rfl, rfl⟩
  · simp only [show Finset.Icc 1 2 = {1, 2} from by decide,
      Finset.sum_pair (by decide : (1 : ℕ) ≠ 2), ha1, ha2] at hsum
    rw [ha3] at hlt
    omega
  · simp only [show Finset.Icc 2 3 = {2, 3} from by decide,
      Finset.sum_pair (by decide : (2 : ℕ) ≠ 3), ha2, ha3] at hsum
    omega
  · rw [show Finset.Icc 1 3 = {1, 2, 3} from by decide,
      Finset.sum_insert (by decide : (1 : ℕ) ∉ ({2, 3} : Finset ℕ)),
      Finset.sum_pair (by decide : (2 : ℕ) ≠ 3), ha1, ha2, ha3] at hsum
    rw [ha3] at hlt
    have ha4_eq : a 4 = 6 := by omega
    have h3_lt_5 : a 3 < 5 := by omega
    have h5_lt_a4 : 5 < a 4 := by omega
    exfalso
    apply hmin 5 h3_lt_5 h5_lt_a4
    refine ⟨2, 3, by omega, by omega, by omega, ?_⟩
    rw [show Finset.Icc 2 3 = {2, 3} from by decide,
      Finset.sum_pair (by decide : (2 : ℕ) ≠ 3), ha2, ha3]

theorem erdos_423.variants.nondecreasing :
    ∀ a : ℕ → ℕ, IsHofstadterSeq a →
    ∀ n m : ℕ, 1 ≤ n → n ≤ m → a n - n ≤ a m - m := by
  intro a ⟨ha1, ha2, hk⟩ n m hn hnm
  have step : ∀ k, 1 ≤ k → a k + 1 ≤ a (k + 1) := by
    intro k hk1
    rcases Nat.lt_or_ge k 2 with h | h
    · obtain rfl : k = 1 := by omega
      rw [ha1, ha2]
    · simpa using (hk (k + 1) (by omega)).2.1
  have ge : ∀ k, 1 ≤ k → k ≤ a k := by
    intro k hk1
    induction k with
    | zero => omega
    | succ j ih =>
      rcases Nat.eq_zero_or_pos j with rfl | hj
      · simp [ha1]
      · have := step j hj; have := ih hj; omega
  induction m, hnm using Nat.le_induction with
  | base => exact le_rfl
  | succ m hnm ih =>
    have h1 := step m (by omega)
    have h2 := ge m (by omega)
    omega

theorem erdos_423.variants.unbounded :
    ∀ a : ℕ → ℕ, IsHofstadterSeq a → ∀ M : ℕ, ∀ᶠ n in atTop, M + n ≤ a n := by
  sorry

theorem IsHofstadterSeq.strictMono {a : ℕ → ℕ} (ha : IsHofstadterSeq a) :
    StrictMono fun k => a (k + 1) := by
  obtain ⟨h1, h2, hk⟩ := ha
  refine strictMono_nat_of_lt_succ fun k => ?_
  show a (k + 1) < a (k + 1 + 1)
  rcases Nat.eq_zero_or_pos k with rfl | hpos
  · show a 1 < a 2
    omega
  · have := (hk (k + 2) (by omega)).2.1
    simpa using this

theorem IsHofstadterSeq.le_apply {a : ℕ → ℕ} (ha : IsHofstadterSeq a) (n : ℕ)
    (hn : 1 ≤ n) : n ≤ a n := by
  have h1 := ha.1
  induction n, hn using Nat.le_induction with
  | base => omega
  | succ k hk ih =>
    have := (IsHofstadterSeq.strictMono ha) (Nat.lt_succ_self (k - 1))
    simp only [show k - 1 + 1 = k by omega, show k - 1 + 1 + 1 = k + 1 by omega] at this
    omega

theorem IsHofstadterSeq.lt_iff_lt {a : ℕ → ℕ} (ha : IsHofstadterSeq a) {i j : ℕ}
    (hi : 1 ≤ i) (hj : 1 ≤ j) :
    a i < a j ↔ i < j := by
  obtain ⟨i, rfl⟩ := Nat.exists_eq_add_of_le' hi
  obtain ⟨j, rfl⟩ := Nat.exists_eq_add_of_le' hj
  rw [(IsHofstadterSeq.strictMono ha).lt_iff_lt]
  omega

theorem IsHofstadterSeq.infinite_compl_of_unbounded {a : ℕ → ℕ} (ha : IsHofstadterSeq a)
    (h : ∀ M : ℕ, ∀ᶠ n in atTop, M + n ≤ a n) : Set.Infinite (Set.range a)ᶜ := by
  refine Set.infinite_of_forall_exists_gt fun N => ?_
  obtain ⟨n, hn⟩ := (h (N + 2)).exists_forall_of_atTop
  obtain ⟨n, hn1, hn⟩ : ∃ n, 1 ≤ n ∧ N + 2 + n ≤ a n :=
    ⟨max n 1, by omega, hn _ (le_max_left _ _)⟩
  -- The `n` values `a 0, …, a (n - 1)` cannot cover the `n + 1` integers in `[N + 1, a n - 1]`.
  have hcard : ((Finset.range n).image a).card < (Finset.Icc (N + 1) (a n - 1)).card := by
    calc ((Finset.range n).image a).card ≤ n := by
          simpa using Finset.card_image_le (s := Finset.range n) (f := a)
      _ < (Finset.Icc (N + 1) (a n - 1)).card := by simp; omega
  obtain ⟨x, hx, hxi⟩ := Finset.exists_mem_notMem_of_card_lt_card hcard
  rw [Finset.mem_Icc] at hx
  refine ⟨x, ?_, by omega⟩
  rintro ⟨k, rfl⟩
  rcases Nat.lt_or_ge k n with hk | hk
  · exact hxi (Finset.mem_image.2 ⟨k, Finset.mem_range.2 hk, rfl⟩)
  · have : a n ≤ a k := by
      rcases eq_or_lt_of_le hk with rfl | hk'
      · exact le_rfl
      · exact ((IsHofstadterSeq.lt_iff_lt ha hn1 (by omega)).2 hk').le
    omega

theorem IsHofstadterSeq.unbounded_of_infinite_compl {a : ℕ → ℕ} (ha : IsHofstadterSeq a)
    (h : Set.Infinite (Set.range a)ᶜ) : ∀ M : ℕ, ∀ᶠ n in atTop, M + n ≤ a n := by
  intro M
  obtain ⟨t, hts, htc⟩ := h.exists_subset_card_eq (M + 1)
  -- All missed values in `t` are at most `X`.
  set X := t.sup id with hX
  rw [Filter.eventually_atTop]
  refine ⟨X + 1, fun n hn => ?_⟩
  have hn1 : 1 ≤ n := by omega
  -- `a 1, …, a n` and the positive elements of `t` are distinct integers in `[1, a n]`.
  set A := (Finset.Icc 1 n).image a with hA
  set T := t.filter (fun x => 1 ≤ x) with hT
  have hAcard : A.card = n := by
    rw [hA, Finset.card_image_of_injOn, Nat.card_Icc]
    · omega
    · intro i hi j hj hij
      rw [Finset.coe_Icc, Set.mem_Icc] at hi hj
      by_contra hne
      rcases Nat.lt_or_gt_of_ne hne with hlt | hlt
      · exact absurd hij ((IsHofstadterSeq.lt_iff_lt ha hi.1 hj.1).2 hlt).ne
      · exact absurd hij.symm ((IsHofstadterSeq.lt_iff_lt ha hj.1 hi.1).2 hlt).ne
  have hTcard : M ≤ T.card := by
    have : (t.filter (fun x => ¬ 1 ≤ x)).card ≤ 1 := by
      calc (t.filter (fun x => ¬ 1 ≤ x)).card ≤ ({0} : Finset ℕ).card :=
            Finset.card_le_card fun x hx => by
              rw [Finset.mem_filter] at hx; simp; omega
        _ = 1 := rfl
    have := Finset.card_filter_add_card_filter_not (s := t) (fun x => 1 ≤ x)
    rw [← hT] at this
    omega
  have hdisj : Disjoint A T := by
    rw [Finset.disjoint_left]
    intro x hxA hxT
    obtain ⟨k, -, rfl⟩ := Finset.mem_image.1 hxA
    exact hts (Finset.mem_filter.1 hxT).1 ⟨k, rfl⟩
  have hsub : A ∪ T ⊆ Finset.Icc 1 (a n) := by
    intro x hx
    rw [Finset.mem_union] at hx
    rw [Finset.mem_Icc]
    rcases hx with hx | hx
    · obtain ⟨k, hk, rfl⟩ := Finset.mem_image.1 hx
      rw [Finset.mem_Icc] at hk
      refine ⟨IsHofstadterSeq.le_apply ha k hk.1 |>.trans' (by omega), ?_⟩
      rcases eq_or_lt_of_le hk.2 with rfl | hlt
      · exact le_rfl
      · exact ((IsHofstadterSeq.lt_iff_lt ha hk.1 hn1).2 hlt).le
    · obtain ⟨hxt, hx1⟩ := Finset.mem_filter.1 hx
      have : x ≤ X := Finset.le_sup (f := id) hxt
      exact ⟨hx1, by have := IsHofstadterSeq.le_apply ha n hn1; omega⟩
  have := Finset.card_le_card hsub
  rw [Finset.card_union_of_disjoint hdisj, hAcard, Nat.card_Icc] at this
  omega

theorem erdos_423.test.unbounded_iff_infinite_complement :
    type_of% erdos_423.variants.unbounded ↔
      type_of% erdos_423.variants.infinite_complement :=
  ⟨fun h a ha => ha.infinite_compl_of_unbounded (h a ha),
   fun h a ha => ha.unbounded_of_infinite_compl (h a ha)⟩

end Erdos423
