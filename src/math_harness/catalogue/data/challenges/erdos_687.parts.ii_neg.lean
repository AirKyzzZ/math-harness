import Mathlib

open Filter

namespace Erdos687

noncomputable def Y (x : ℕ) : ℕ :=
  sSup {y : ℕ | Green46.IsCoveredByResidues x y}

theorem maxY_eq_Y (x : ℕ) : Green46.maxY x = Y x := rfl

theorem lt_primorial_of_isCoveredByResidues {x y : ℕ} (h : Green46.IsCoveredByResidues x y) :
    y < primorial x := by
  obtain ⟨a, ha⟩ := h
  refine lt_of_not_ge fun hy ↦ ?_
  let t := (Finset.range (x + 1)).filter Nat.Prime
  have hs : ∀ p ∈ t, (fun p : ℕ ↦ p) p ≠ 0 := fun p hp ↦ (Finset.mem_filter.1 hp).2.ne_zero
  have pp : Set.Pairwise (t : Set ℕ) (Function.onFun Nat.Coprime fun p : ℕ ↦ p) :=
    fun p hp q hq hpq ↦
      (Nat.coprime_primes (Finset.mem_filter.1 hp).2 (Finset.mem_filter.1 hq).2).2 hpq
  -- By the Chinese remainder theorem, `k ≡ a p + 1 (mod p)` for every prime `p ≤ x`.
  let k := Nat.chineseRemainderOfFinset (fun p ↦ a p + 1) (fun p ↦ p) t hs pp
  have hk : (k : ℕ) < primorial x := Nat.chineseRemainderOfFinset_lt_prod _ _ hs pp
  -- Shift `k` into `[1, primorial x]` without changing its residues.
  obtain ⟨m, hm1, hmP, hmk⟩ :
      ∃ m, 1 ≤ m ∧ m ≤ primorial x ∧ ∀ p ∈ t, m ≡ k [MOD p] := by
    by_cases h0 : (k : ℕ) = 0
    · refine ⟨primorial x, primorial_pos x, le_rfl, fun p hp ↦ ?_⟩
      have hp' := Finset.mem_filter.1 hp
      rw [h0]
      exact Nat.modEq_zero_iff_dvd.2
        (hp'.2.dvd_primorial_iff.2 (Nat.lt_succ_iff.1 (Finset.mem_range.1 hp'.1)))
    · exact ⟨k, Nat.one_le_iff_ne_zero.2 h0, hk.le, fun p _ ↦ Nat.ModEq.refl _⟩
  obtain ⟨p, hpx, hp, hpm⟩ := ha m (Finset.mem_Icc.2 ⟨hm1, hmP.trans hy⟩)
  have hpt : p ∈ t := Finset.mem_filter.2 ⟨Finset.mem_range.2 (Nat.lt_succ_of_le hpx), hp⟩
  have h1 : a p ≡ a p + 1 [MOD p] := hpm.symm.trans ((hmk p hpt).trans (k.2 p hpt))
  have hd : p ∣ 1 := by simpa using (Nat.modEq_iff_dvd' (Nat.le_add_right (a p) 1)).1 h1
  exact hp.not_dvd_one hd

theorem Y_two : Y 2 = 1 := by
  have h1 : Green46.IsCoveredByResidues 2 1 := by
    refine ⟨fun _ ↦ 1, fun m hm ↦ ⟨2, le_rfl, Nat.prime_two, ?_⟩⟩
    have := Finset.mem_Icc.1 hm
    show m % 2 = 1 % 2
    omega
  have h2 : ∀ y, Green46.IsCoveredByResidues 2 y → y ≤ 1 := by
    rintro y ⟨a, ha⟩
    by_contra hy
    obtain ⟨p, hp2, hp, hp1⟩ := ha 1 (Finset.mem_Icc.2 ⟨le_rfl, by omega⟩)
    obtain ⟨q, hq2, hq, hq1⟩ := ha 2 (Finset.mem_Icc.2 ⟨by omega, by omega⟩)
    rw [le_antisymm hp2 hp.two_le] at hp1
    rw [le_antisymm hq2 hq.two_le] at hq1
    exact absurd (hp1.trans hq1.symm) (by decide)
  rw [Y]
  exact IsGreatest.csSup_eq ⟨h1, h2⟩

theorem Y_three : Y 3 = 3 := by
  have h1 : Green46.IsCoveredByResidues 3 3 := by
    refine ⟨fun p ↦ if p = 2 then 1 else 2, fun m hm ↦ ?_⟩
    obtain ⟨hm1, hm3⟩ := Finset.mem_Icc.1 hm
    interval_cases m
    · exact ⟨2, by norm_num, Nat.prime_two, by decide⟩
    · exact ⟨3, le_rfl, Nat.prime_three, by decide⟩
    · exact ⟨2, by norm_num, Nat.prime_two, by decide⟩
  have h2 : ∀ y, Green46.IsCoveredByResidues 3 y → y ≤ 3 := by
    rintro y ⟨a, ha⟩
    by_contra hy
    have key : ∀ m, 1 ≤ m → m ≤ 4 → m % 2 = a 2 % 2 ∨ m % 3 = a 3 % 3 := by
      intro m hm1 hm4
      obtain ⟨p, hp3, hp, hpm⟩ := ha m (Finset.mem_Icc.2 ⟨hm1, by omega⟩)
      interval_cases p
      · exact absurd hp (by decide)
      · exact absurd hp (by decide)
      · exact Or.inl hpm
      · exact Or.inr hpm
    have k1 := key 1 le_rfl (by norm_num)
    have k2 := key 2 (by norm_num) (by norm_num)
    have k3 := key 3 (by norm_num) (by norm_num)
    have k4 := key 4 (by norm_num) le_rfl
    omega
  rw [Y]
  exact IsGreatest.csSup_eq ⟨h1, h2⟩

theorem erdos_687.parts.ii_neg :
    ¬ ((fun x : ℕ ↦ (Y x : ℝ)) =o[atTop] (fun x : ℕ ↦ (x : ℝ) ^ 2)) := by
  sorry

end Erdos687
