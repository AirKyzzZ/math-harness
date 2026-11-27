import Mathlib

namespace Erdos219

def primeArithmeticProgressions : Set (Set ℕ) :=
  {s | (∀ p ∈ s, p.Prime) ∧ ∃ l > 0, s.IsAPOfLength l}

theorem primeArithmeticProgression_3_5_7 : {3, 5, 7} ∈ primeArithmeticProgressions := by
  simp only [primeArithmeticProgressions, gt_iff_lt, Set.IsAPOfLength, Set.IsAPOfLengthWith,
    smul_eq_mul, exists_prop, exists_and_left, existsAndEq, true_and, Set.mem_ofPred_eq,
    Set.mem_insert_iff, Set.mem_singleton_iff, forall_eq_or_imp, forall_eq,
    ENat.card_eq_coe_fintype_card, Fintype.card_ofFinset, Set.toFinset_insert,
    Set.toFinset_singleton, Finset.mem_insert, Nat.reduceEqDiff, Finset.mem_singleton, or_self,
    not_false_eq_true, Finset.card_insert_of_notMem, Finset.card_singleton, Nat.reduceAdd,
    Nat.cast_ofNat, Nat.ofNat_pos, Nat.cast_lt_ofNat]
  refine ⟨by norm_num, ⟨3, 2, Set.ext fun x => ?_⟩⟩
  refine ⟨?_, fun ⟨w, ⟨hl, hr⟩⟩ => by interval_cases w <;> simp_all⟩
  rintro (rfl | rfl | rfl)
  · simp
  · simpa using ⟨1, by simp⟩
  · simpa using ⟨2, by simp⟩

theorem not_primeArithmeticProgression_1_2 : ¬{1, 2} ∈ primeArithmeticProgressions := by
  simp [primeArithmeticProgressions]

theorem empty_not_primeArithmeticProgression : ∅ ∉ primeArithmeticProgressions := by
  simpa [primeArithmeticProgressions] using fun _ hl ↦ Set.not_isAPOfLength_empty hl

lemma singleton_mem_primeArithmeticProgressions
    {p : ℕ} (hp : p.Prime) : {p} ∈ primeArithmeticProgressions := by
  simpa [primeArithmeticProgressions, hp] using ⟨1, one_pos, by simp⟩

lemma pair_mem_primeArithmeticProgressions
    {p q : ℕ} (hp : p.Prime) (hq : q.Prime) (hpq : p < q) :
    {p, q} ∈ primeArithmeticProgressions := by
  let ⟨n, h⟩ := Nat.exists_eq_add_of_lt hpq
  simpa [primeArithmeticProgressions, hp, hq] using ⟨2, by norm_num, Nat.isAPOfLength_pair hpq⟩

theorem erdos_219_neg :
    ¬ (∀ N : ℕ, ∃ l ∈ primeArithmeticProgressions, N ≤ ENat.card l) := by
  sorry

end Erdos219
