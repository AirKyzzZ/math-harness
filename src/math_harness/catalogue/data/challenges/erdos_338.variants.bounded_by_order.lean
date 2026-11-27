import Mathlib

namespace Erdos338

open Filter

def HasOrder (A : Set ℕ) (h : ℕ) : Prop :=
  ∀ᶠ m in atTop, ∃ S : Multiset ℕ, (∀ x ∈ S, x ∈ A) ∧ S.card ≤ h ∧ S.sum = m

def HasRestrictedOrder (A : Set ℕ) (t : ℕ) : Prop :=
  ∀ᶠ m in atTop, ∃ S : Finset ℕ, (∀ x ∈ S, x ∈ A) ∧ S.card ≤ t ∧ ∑ x ∈ S, x = m

noncomputable def basisOrder (A : Set ℕ) : ℕ∞ :=
  ⨅ (h : ℕ) (_ : HasOrder A h), (h : ℕ∞)

noncomputable def restrictedOrder (A : Set ℕ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : HasRestrictedOrder A t), (t : ℕ∞)

theorem erdos_338.variants.bounded_by_order :
    ∃ f : ℕ → ℕ, ∀ (A : Set ℕ) (h : ℕ), HasOrder A h → (∃ t, HasRestrictedOrder A t) → HasRestrictedOrder A (f h) := by
  sorry

section KellyConjecture

private inductive Ternary01 : ℕ → Prop
  | zero : Ternary01 0
  | three {a : ℕ} : Ternary01 a → Ternary01 (3 * a)
  | three_add_one {a : ℕ} : Ternary01 a → Ternary01 (3 * a + 1)

private lemma Ternary01.mod_div {a : ℕ} (h : Ternary01 a) : a % 3 ≤ 1 ∧ Ternary01 (a / 3) := by
  cases h with
  | zero => exact ⟨by norm_num, by rw [Nat.zero_div]; exact .zero⟩
  | @three a h => exact ⟨by omega, by rwa [show 3 * a / 3 = a by omega]⟩
  | @three_add_one a h => exact ⟨by omega, by rwa [show (3 * a + 1) / 3 = a by omega]⟩

private lemma Ternary01.exists_add (k : ℕ) : ∃ a b, Ternary01 a ∧ Ternary01 b ∧ a + b = k := by
  induction k using Nat.strong_induction_on with
  | _ k ih =>
    rcases Nat.eq_zero_or_pos k with rfl | hk
    · exact ⟨0, 0, .zero, .zero, rfl⟩
    obtain ⟨a, b, ha, hb, hab⟩ := ih (k / 3) (by omega)
    rcases (by omega : k % 3 = 0 ∨ k % 3 = 1 ∨ k % 3 = 2) with h | h | h
    · exact ⟨3 * a, 3 * b, ha.three, hb.three, by omega⟩
    · exact ⟨3 * a + 1, 3 * b, ha.three_add_one, hb.three, by omega⟩
    · exact ⟨3 * a + 1, 3 * b + 1, ha.three_add_one, hb.three_add_one, by omega⟩

private lemma Ternary01.exists_add_two_mul (k : ℕ) :
    ∃ a c, Ternary01 a ∧ Ternary01 c ∧ a + 2 * c = k := by
  induction k using Nat.strong_induction_on with
  | _ k ih =>
    rcases Nat.eq_zero_or_pos k with rfl | hk
    · exact ⟨0, 0, .zero, .zero, rfl⟩
    obtain ⟨a, c, ha, hc, hac⟩ := ih (k / 3) (by omega)
    rcases (by omega : k % 3 = 0 ∨ k % 3 = 1 ∨ k % 3 = 2) with h | h | h
    · exact ⟨3 * a, 3 * c, ha.three, hc.three, by omega⟩
    · exact ⟨3 * a + 1, 3 * c, ha.three_add_one, hc.three, by omega⟩
    · exact ⟨3 * a, 3 * c + 1, ha.three, hc.three_add_one, by omega⟩

private lemma Ternary01.eq_of_add {a b c : ℕ} (ha : Ternary01 a) (hb : Ternary01 b)
    (hc : Ternary01 c) (j : ℕ) (h : a + b + 2 * c + 1 = 3 ^ j) : a = b := by
  induction j generalizing a b c with
  | zero => rw [pow_zero] at h; omega
  | succ j ih =>
    obtain ⟨ha3, ha'⟩ := ha.mod_div
    obtain ⟨hb3, hb'⟩ := hb.mod_div
    obtain ⟨hc3, hc'⟩ := hc.mod_div
    rw [pow_succ] at h
    have := ih ha' hb' hc' (by omega)
    omega

private def ternaryBasis : Set ℕ := {m | ∃ a, Ternary01 a ∧ (m = 2 * a + 1 ∨ m = 4 * a)}

private lemma mem_ternaryBasis {m : ℕ} :
    m ∈ ternaryBasis ↔ ∃ a, Ternary01 a ∧ (m = 2 * a + 1 ∨ m = 4 * a) :=
  Iff.rfl

private lemma hasOrder_ternaryBasis : HasOrder ternaryBasis 2 := by
  unfold HasOrder
  refine eventually_atTop.2 ⟨1, fun m hm ↦ ?_⟩
  obtain ⟨k, rfl | rfl⟩ := Nat.even_or_odd' m
  · obtain ⟨a, b, ha, hb, hab⟩ := Ternary01.exists_add (k - 1)
    refine ⟨{2 * a + 1, 2 * b + 1}, ?_, by simp, ?_⟩
    · simp only [Multiset.insert_eq_cons, Multiset.mem_cons, Multiset.mem_singleton]
      rintro x (rfl | rfl)
      exacts [mem_ternaryBasis.2 ⟨a, ha, .inl rfl⟩, mem_ternaryBasis.2 ⟨b, hb, .inl rfl⟩]
    · simp only [Multiset.insert_eq_cons, Multiset.sum_cons, Multiset.sum_singleton]
      omega
  · obtain ⟨a, c, ha, hc, rfl⟩ := Ternary01.exists_add_two_mul k
    refine ⟨{2 * a + 1, 4 * c}, ?_, by simp, ?_⟩
    · simp only [Multiset.insert_eq_cons, Multiset.mem_cons, Multiset.mem_singleton]
      rintro x (rfl | rfl)
      exacts [mem_ternaryBasis.2 ⟨a, ha, .inl rfl⟩, mem_ternaryBasis.2 ⟨c, hc, .inr rfl⟩]
    · simp only [Multiset.insert_eq_cons, Multiset.sum_cons, Multiset.sum_singleton]
      omega

private lemma not_hasRestrictedOrder_ternaryBasis : ¬ HasRestrictedOrder ternaryBasis 3 := by
  intro hR
  unfold HasRestrictedOrder at hR
  obtain ⟨N, hN⟩ := eventually_atTop.1 hR
  obtain ⟨S, hSA, hS3, hSsum⟩ :=
    hN (2 * 3 ^ N) (by have := Nat.lt_pow_self (n := N) (by norm_num : 1 < 3); omega)
  have hP : 3 ^ N % 2 = 1 := Nat.odd_iff.1 (Odd.pow (by decide))
  interval_cases h : S.card
  · rw [Finset.card_eq_zero.1 h, Finset.sum_empty] at hSsum
    omega
  · obtain ⟨x, rfl⟩ := Finset.card_eq_one.1 h
    rw [Finset.sum_singleton] at hSsum
    obtain ⟨a, ha, rfl | rfl⟩ := mem_ternaryBasis.1 (hSA x (by simp)) <;> omega
  · obtain ⟨x, y, hxy, rfl⟩ := Finset.card_eq_two.1 h
    rw [Finset.sum_pair hxy] at hSsum
    obtain ⟨a, ha, rfl | rfl⟩ := mem_ternaryBasis.1 (hSA x (by simp)) <;>
      obtain ⟨b, hb, rfl | rfl⟩ := mem_ternaryBasis.1 (hSA y (by simp)) <;>
      first
      | omega
      | (have := ha.eq_of_add hb .zero N (by omega); omega)
  · obtain ⟨x, y, z, hxy, hxz, hyz, rfl⟩ := Finset.card_eq_three.1 h
    rw [Finset.sum_insert (by simp [hxy, hxz]), Finset.sum_pair hyz] at hSsum
    obtain ⟨a, ha, rfl | rfl⟩ := mem_ternaryBasis.1 (hSA x (by simp)) <;>
      obtain ⟨b, hb, rfl | rfl⟩ := mem_ternaryBasis.1 (hSA y (by simp)) <;>
      obtain ⟨c, hc, rfl | rfl⟩ := mem_ternaryBasis.1 (hSA z (by simp)) <;>
      first
      | omega
      | (have := ha.eq_of_add hb hc N (by omega); omega)
      | (have := ha.eq_of_add hc hb N (by omega); omega)
      | (have := hb.eq_of_add hc ha N (by omega); omega)

end KellyConjecture

theorem erdos_338.variants.kelly_conjecture :
    ¬ ∀ A : Set ℕ, HasOrder A 2 → HasRestrictedOrder A 3 :=
  fun h ↦ not_hasRestrictedOrder_ternaryBasis (h _ hasOrder_ternaryBasis)

end Erdos338
