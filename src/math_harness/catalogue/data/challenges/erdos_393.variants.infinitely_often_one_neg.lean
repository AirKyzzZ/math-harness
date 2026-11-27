import Mathlib

open Filter Asymptotics

open scoped Nat

namespace Erdos393

noncomputable def f (n : ℕ) : ℕ :=
  sInf {m : ℕ | 1 ≤ m ∧ ∃ a : ℕ, ∃ s ⊆ Finset.Icc a (a + m), a ∈ s ∧ a + m ∈ s ∧
    ∏ i ∈ s, i = n !}

theorem one_le_f (n : ℕ) (hn : 2 ≤ n) : 1 ≤ f n := by
  have hprod : ∏ i ∈ Finset.Ico 1 (n + 1), i = n ! := Finset.prod_Ico_id_eq_factorial n
  refine le_csInf ⟨n - 1, by omega, 1, Finset.Ico 1 (n + 1), ?_, ?_, ?_, hprod⟩ fun _ hm ↦ hm.1
  · intro i hi
    obtain ⟨h1, h2⟩ := Finset.mem_Ico.1 hi
    exact Finset.mem_Icc.2 ⟨h1, by omega⟩
  · exact Finset.mem_Ico.2 ⟨le_rfl, by omega⟩
  · exact Finset.mem_Ico.2 ⟨by omega, by omega⟩

theorem f_three : f 3 = 1 :=
  le_antisymm (Nat.sInf_le ⟨le_rfl, 2, {2, 3}, by decide, by decide, by decide, by decide⟩)
    (one_le_f 3 (by norm_num))

theorem f_seven_le_two : f 7 ≤ 2 :=
  Nat.sInf_le ⟨by norm_num, 70, {70, 72}, by decide, by decide, by decide, by decide⟩

theorem f_le_sub_two (n : ℕ) (hn : 3 ≤ n) : f n ≤ n - 2 := by
  have hprod : ∏ i ∈ Finset.Ico 2 (n + 1), i = n ! := by
    have h := Finset.prod_eq_prod_Ico_succ_bot (show 1 < n + 1 by omega) (fun i ↦ i)
    rw [Finset.prod_Ico_id_eq_factorial, one_mul] at h
    exact h.symm
  refine Nat.sInf_le ⟨by omega, 2, Finset.Ico 2 (n + 1), ?_, ?_, ?_, hprod⟩
  · intro i hi
    obtain ⟨h1, h2⟩ := Finset.mem_Ico.1 hi
    exact Finset.mem_Icc.2 ⟨h1, by omega⟩
  · exact Finset.mem_Ico.2 ⟨le_rfl, by omega⟩
  · exact Finset.mem_Ico.2 ⟨by omega, by omega⟩

theorem f_one : f 1 = 0 := by
  refine Nat.sInf_eq_zero.2 (Or.inr (Set.eq_empty_of_forall_notMem ?_))
  rintro m ⟨hm, a, s, -, ha, hb, hs⟩
  have h1 : a ∣ ∏ i ∈ s, i := Finset.dvd_prod_of_mem (fun i ↦ i) ha
  have h2 : a + m ∣ ∏ i ∈ s, i := Finset.dvd_prod_of_mem (fun i ↦ i) hb
  rw [hs, Nat.factorial_one] at h1 h2
  have ha1 := Nat.eq_one_of_dvd_one h1
  have hb1 := Nat.eq_one_of_dvd_one h2
  omega

theorem erdos_393.variants.infinitely_often_one_neg :
    ¬ ({n : ℕ | f n = 1}.Infinite) := by
  sorry

end Erdos393
