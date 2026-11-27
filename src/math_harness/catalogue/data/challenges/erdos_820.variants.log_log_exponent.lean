import Mathlib

open Filter

namespace Erdos820

noncomputable def H (n : ℕ) : ℕ :=
  sInf {l : ℕ | ∃ k : ℕ, 2 ≤ k ∧ k < l ∧ Nat.Coprime (k ^ n - 1) (l ^ n - 1)}

noncomputable def K (n : ℕ) : ℕ :=
  sInf {k : ℕ | 2 ≤ k ∧ Nat.Coprime (k ^ n - 1) (2 ^ n - 1)}

theorem H_spec {n : ℕ} (hn : 1 ≤ n) :
    ∃ k : ℕ, 2 ≤ k ∧ k < H n ∧ Nat.Coprime (k ^ n - 1) (H n ^ n - 1) := by
  have hne : {l : ℕ | ∃ k : ℕ, 2 ≤ k ∧ k < l ∧ Nat.Coprime (k ^ n - 1) (l ^ n - 1)}.Nonempty := by
    obtain rfl | hn2 := hn.eq_or_lt
    · exact ⟨3, 2, le_rfl, by norm_num, by decide⟩
    · have h4 : 4 ≤ 2 ^ n :=
        calc 4 = 2 ^ 2 := by norm_num
          _ ≤ 2 ^ n := Nat.pow_le_pow_right (by norm_num) hn2
      refine ⟨2 ^ n - 1, 2, le_rfl, by omega, ?_⟩
      have h1 : 1 ≤ (2 ^ n - 1) ^ n := Nat.one_le_pow _ _ (by omega)
      exact Nat.Coprime.coprime_dvd_left (dvd_pow_self _ (by omega))
        ((Nat.coprime_self_sub_right h1).2 (Nat.coprime_one_right _))
  exact Nat.sInf_mem hne

theorem H_eq_three_iff (n : ℕ) : H n = 3 ↔ Nat.Coprime (2 ^ n - 1) (3 ^ n - 1) := by
  constructor
  · intro h
    have hne : {l : ℕ | ∃ k : ℕ, 2 ≤ k ∧ k < l ∧ Nat.Coprime (k ^ n - 1) (l ^ n - 1)}.Nonempty :=
      Nat.nonempty_of_pos_sInf (by unfold H at h; omega)
    have hmem : H n ∈ {l : ℕ | ∃ k : ℕ, 2 ≤ k ∧ k < l ∧ Nat.Coprime (k ^ n - 1) (l ^ n - 1)} :=
      Nat.sInf_mem hne
    rw [h] at hmem
    obtain ⟨k, hk2, hk3, hk⟩ := hmem
    obtain rfl : k = 2 := by omega
    exact hk
  · intro h
    unfold H
    refine le_antisymm (Nat.sInf_le ⟨2, le_rfl, by norm_num, h⟩)
      (le_csInf ⟨3, 2, le_rfl, by norm_num, h⟩ ?_)
    rintro l ⟨k, hk2, hkl, -⟩
    omega

theorem H_one_to_ten :
    H 1 = 3 ∧ H 2 = 3 ∧ H 3 = 3 ∧ H 4 = 6 ∧ H 5 = 3 ∧ H 6 = 18 ∧ H 7 = 3 ∧ H 8 = 6 ∧
      H 9 = 3 ∧ H 10 = 12 := by
  have key : ∀ n m : ℕ, (∃ k, 2 ≤ k ∧ k < m ∧ Nat.Coprime (k ^ n - 1) (m ^ n - 1)) →
      (∀ l < m, ∀ k < l, 2 ≤ k → ¬ Nat.Coprime (k ^ n - 1) (l ^ n - 1)) → H n = m := by
    intro n m hm hlt
    unfold H
    refine le_antisymm (Nat.sInf_le hm) (le_csInf ⟨m, hm⟩ ?_)
    rintro l ⟨k, hk2, hkl, hk⟩
    by_contra! h
    exact hlt l h k hkl hk2 hk
  have three (n : ℕ) (h : Nat.Coprime (2 ^ n - 1) (3 ^ n - 1)) : H n = 3 :=
    (H_eq_three_iff n).2 h
  exact ⟨three 1 (by decide), three 2 (by decide), three 3 (by decide),
    key 4 6 ⟨5, by decide⟩ (by decide +kernel), three 5 (by decide),
    key 6 18 ⟨14, by decide⟩ (by decide +kernel), three 7 (by decide),
    key 8 6 ⟨5, by decide⟩ (by decide +kernel), three 9 (by decide),
    key 10 12 ⟨11, by decide⟩ (by decide +kernel)⟩

theorem erdos_820.variants.log_log_exponent :
    ∃ c > (0 : ℝ), ∀ ε > (0 : ℝ), (∃ᶠ n : ℕ in atTop, Real.exp ((n : ℝ) ^ ((c - ε) / Real.log (Real.log (n : ℝ)))) < (H n : ℝ)) ∧ ∀ᶠ n : ℕ in atTop, (H n : ℝ) < Real.exp ((n : ℝ) ^ ((c + ε) / Real.log (Real.log (n : ℝ)))) := by
  sorry

end Erdos820
