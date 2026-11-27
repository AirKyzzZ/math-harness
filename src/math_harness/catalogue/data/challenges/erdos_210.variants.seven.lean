import Mathlib

namespace Erdos210

open EuclideanGeometry Filter

noncomputable def f (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ s : Finset ℝ²,
    s.card = n ∧ ¬ Collinear ℝ (s : Set ℝ²) ∧ (ordinaryLines s).card = m}

theorem erdos_210.variants.seven :
    f 7 = 3 := by
  sorry

theorem f_le {n : ℕ} {s : Finset ℝ²} (hn : s.card = n)
    (hs : ¬ Collinear ℝ (s : Set ℝ²)) : f n ≤ (ordinaryLines s).card :=
  csInf_le ⟨0, fun _ _ => Nat.zero_le _⟩ ⟨s, hn, hs, rfl⟩

theorem triangle_not_collinear :
    ¬ Collinear ℝ ({!₂[(0 : ℝ), 0], !₂[(1 : ℝ), 0], !₂[(0 : ℝ), 1]} : Set ℝ²) := by
  intro h
  have heq : (!₂[(0 : ℝ), 0] : ℝ²) ≠ !₂[(1 : ℝ), 0] := by
    intro he
    have := congrArg (fun p : ℝ² => p 0) he
    norm_num at this
  have hm : (!₂[(0 : ℝ), 1] : ℝ²) ∈ line[ℝ, !₂[(0 : ℝ), 0], !₂[(1 : ℝ), 0]] :=
    h.mem_affineSpan_of_mem_of_ne (by simp) (by simp) (by simp) heq
  obtain ⟨t, ht⟩ := mem_affineSpan_pair_iff_exists_lineMap_eq.mp hm
  have := congrArg (fun p : ℝ² => p 1) ht
  norm_num [AffineMap.lineMap_apply] at this

theorem exists_configuration {n : ℕ} (hn : 3 ≤ n) :
    ∃ s : Finset ℝ², s.card = n ∧ ¬ Collinear ℝ (s : Set ℝ²) := by
  classical
  let t : Finset ℝ² := {!₂[(0 : ℝ), 0], !₂[(1 : ℝ), 0], !₂[(0 : ℝ), 1]}
  have ht : t.card ≤ n := by
    calc
      t.card ≤ 3 := Finset.card_le_three
      _ ≤ n := hn
  obtain ⟨s, hts, hsn⟩ := Infinite.exists_superset_card_eq t n ht
  refine ⟨s, hsn, fun hs => triangle_not_collinear (hs.subset ?_)⟩
  intro p hp
  apply hts
  simpa [t] using hp

theorem f_attained {n : ℕ} (hn : 3 ≤ n) :
    ∃ s : Finset ℝ², s.card = n ∧ ¬ Collinear ℝ (s : Set ℝ²) ∧
      (ordinaryLines s).card = f n := by
  obtain ⟨s, hs, hcol⟩ := exists_configuration hn
  apply csInf_mem (s := {m : ℕ | ∃ s : Finset ℝ²,
    s.card = n ∧ ¬ Collinear ℝ (s : Set ℝ²) ∧ (ordinaryLines s).card = m})
  exact ⟨(ordinaryLines s).card, s, hs, hcol, rfl⟩

theorem le_f_iff {n m : ℕ} (hn : 3 ≤ n) :
    m ≤ f n ↔ ∀ s : Finset ℝ², s.card = n → ¬ Collinear ℝ (s : Set ℝ²) →
      m ≤ (ordinaryLines s).card := by
  constructor
  · exact fun h s hs hc => h.trans (f_le hs hc)
  · intro h
    obtain ⟨s, hs, hc, hcard⟩ := f_attained hn
    simpa [hcard] using h s hs hc

theorem erdos_210.variants.sylvester_gallai {n : ℕ} (hn : 3 ≤ n) : 1 ≤ f n := by
  apply (le_f_iff hn).mpr
  intro s _ hs
  exact (ordinaryLines_nonempty hs).card_pos

theorem tendsto_of_kelly_moser (h : ∀ n : ℕ, 3 ≤ n → 3 * n ≤ 7 * f n) :
    Tendsto f atTop atTop := by
  apply tendsto_atTop.mpr
  intro m
  filter_upwards [eventually_ge_atTop (max 3 (7 * m))] with n hn
  have hbound := h n (le_trans (le_max_left _ _) hn)
  have hn' := le_trans (le_max_right _ _) hn
  omega

theorem tendsto_of_green_tao (h : ∀ᶠ n : ℕ in atTop, n ≤ 2 * f n) : Tendsto f atTop atTop := by
  apply tendsto_atTop.mpr
  intro m
  filter_upwards [h, eventually_ge_atTop (2 * m)] with n hn hm
  omega

def axisPoint (i : ℕ) : ℝ² := !₂[(i : ℝ), 0]

def apex : ℝ² := !₂[(0 : ℝ), 1]

noncomputable def nearPencil (n : ℕ) : Finset ℝ² := by
  classical
  exact insert apex ((Finset.range (n - 1)).image axisPoint)

theorem axisPoint_injective : Function.Injective axisPoint := by
  intro i j h
  have := congrArg (fun p : ℝ² => p 0) h
  simpa [axisPoint] using this

theorem apex_ne_axisPoint (i : ℕ) : apex ≠ axisPoint i := by
  intro h
  have := congrArg (fun p : ℝ² => p 1) h
  norm_num [apex, axisPoint] at this

theorem axisPoint_mem (i : ℕ) : axisPoint i ∈ line[ℝ, axisPoint 0, axisPoint 1] := by
  apply mem_affineSpan_pair_iff_exists_lineMap_eq.mpr
  refine ⟨(i : ℝ), ?_⟩
  ext j
  fin_cases j <;> simp [axisPoint, AffineMap.lineMap_apply]

theorem nearPencil_card {n : ℕ} (hn : 1 ≤ n) : (nearPencil n).card = n := by
  classical
  have hap : apex ∉ (Finset.range (n - 1)).image axisPoint := by
    simp only [Finset.mem_image]
    rintro ⟨i, _, hi⟩
    exact apex_ne_axisPoint i hi.symm
  rw [nearPencil, Finset.card_insert_of_notMem hap, Finset.card_image_of_injective _
    axisPoint_injective, Finset.card_range]
  omega

theorem nearPencil_not_collinear {n : ℕ} (hn : 3 ≤ n) :
    ¬ Collinear ℝ (nearPencil n : Set ℝ²) := by
  classical
  intro h
  apply triangle_not_collinear
  apply h.subset
  intro p hp
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp
  have haxis (i : ℕ) (hi : i < n - 1) : axisPoint i ∈ nearPencil n := by
    simp only [nearPencil, Finset.mem_insert, Finset.mem_image]
    exact Or.inr ⟨i, Finset.mem_range.mpr hi, rfl⟩
  rcases hp with rfl | rfl | rfl
  · simpa [axisPoint] using haxis 0 (by omega)
  · simpa [axisPoint] using haxis 1 (by omega)
  · change apex ∈ nearPencil n
    simp [nearPencil]

open scoped Classical in
theorem ordinaryLines_nearPencil_subset (n : ℕ) :
    ordinaryLines (nearPencil n) ⊆
      insert (line[ℝ, axisPoint 0, axisPoint 1])
        (((Finset.range (n - 1)).image axisPoint).image fun p => line[ℝ, apex, p]) := by
  intro L hL
  obtain ⟨⟨a, ha, b, hb, hab, rfl⟩, _⟩ := mem_ordinaryLines.mp hL
  simp only [nearPencil, Finset.mem_insert] at ha hb
  rcases ha with rfl | ha
  · rcases hb with rfl | hb
    · exact (hab rfl).elim
    · exact Finset.mem_insert_of_mem (Finset.mem_image.mpr ⟨b, hb, rfl⟩)
  · rcases hb with rfl | hb
    · exact Finset.mem_insert_of_mem
        (Finset.mem_image.mpr ⟨a, ha, AffineSubspace.affineSpan_pair_comm⟩)
    · obtain ⟨i, _, rfl⟩ := Finset.mem_image.mp ha
      obtain ⟨j, _, rfl⟩ := Finset.mem_image.mp hb
      have heq := affineSpan_pair_eq_of_mem_of_mem_of_ne
        (axisPoint_mem i) (axisPoint_mem j) hab
      exact Finset.mem_insert.mpr (Or.inl heq)

theorem ordinaryLines_nearPencil_le {n : ℕ} (hn : 1 ≤ n) :
    (ordinaryLines (nearPencil n)).card ≤ n := by
  classical
  calc
    (ordinaryLines (nearPencil n)).card ≤ _ := Finset.card_le_card (ordinaryLines_nearPencil_subset n)
    _ ≤ (((Finset.range (n - 1)).image axisPoint).image
      fun p => line[ℝ, apex, p]).card + 1 := Finset.card_insert_le _ _
    _ ≤ ((Finset.range (n - 1)).image axisPoint).card + 1 :=
      Nat.add_le_add_right Finset.card_image_le 1
    _ ≤ (Finset.range (n - 1)).card + 1 := Nat.add_le_add_right Finset.card_image_le 1
    _ = n := by rw [Finset.card_range]; omega

theorem erdos_210.upper_bound {n : ℕ} (hn : 3 ≤ n) : f n ≤ n :=
  (f_le (nearPencil_card (by omega)) (nearPencil_not_collinear hn)).trans
    (ordinaryLines_nearPencil_le (by omega))

theorem f_isBigO : (fun n : ℕ => (f n : ℝ)) =O[atTop] (fun n : ℕ => (n : ℝ)) := by
  apply Asymptotics.IsBigO.of_bound 1
  filter_upwards [eventually_ge_atTop 3] with n hn
  simpa using (Nat.cast_le.mpr (erdos_210.upper_bound hn) : (f n : ℝ) ≤ (n : ℝ))

theorem linear_growth_of_kelly_moser (h : ∀ n : ℕ, 3 ≤ n → 3 * n ≤ 7 * f n) :
    (fun n : ℕ => (f n : ℝ)) =Θ[atTop] (fun n : ℕ => (n : ℝ)) := by
  refine ⟨f_isBigO, Asymptotics.IsBigO.of_bound 7 ?_⟩
  filter_upwards [eventually_ge_atTop 3] with n hn
  have hb := h n hn
  have hb' : n ≤ 7 * f n := by omega
  have hr : (n : ℝ) ≤ 7 * (f n : ℝ) := by exact_mod_cast hb'
  simpa using hr

theorem linear_growth_of_green_tao (h : ∀ᶠ n : ℕ in atTop, n ≤ 2 * f n) :
    (fun n : ℕ => (f n : ℝ)) =Θ[atTop] (fun n : ℕ => (n : ℝ)) := by
  refine ⟨f_isBigO, Asymptotics.IsBigO.of_bound 2 ?_⟩
  filter_upwards [h] with n hn
  have hr : (n : ℝ) ≤ 2 * (f n : ℝ) := by exact_mod_cast hn
  simpa using hr

theorem collinear_of_card_lt_three {s : Finset ℝ²} (hs : s.card < 3) :
    Collinear ℝ (s : Set ℝ²) := by
  classical
  have hc : s.card = 0 ∨ s.card = 1 ∨ s.card = 2 := by omega
  rcases hc with hc | hc | hc
  · have he : s = ∅ := Finset.card_eq_zero.mp hc
    simpa [he] using collinear_empty ℝ ℝ²
  · obtain ⟨a, rfl⟩ := Finset.card_eq_one.mp hc
    simpa using collinear_singleton ℝ a
  · obtain ⟨a, b, _, rfl⟩ := Finset.card_eq_two.mp hc
    simpa using collinear_pair ℝ a b

theorem f_eq_zero_of_lt_three {n : ℕ} (hn : n < 3) : f n = 0 := by
  have he : {m : ℕ | ∃ s : Finset ℝ²,
      s.card = n ∧ ¬ Collinear ℝ (s : Set ℝ²) ∧ (ordinaryLines s).card = m} = ∅ := by
    apply Set.eq_empty_iff_forall_notMem.mpr
    rintro m ⟨s, hs, hc, _⟩
    exact hc (collinear_of_card_lt_three (by omega))
  simp [f, he]

theorem kelly_moser_iff : (∀ n : ℕ, 3 ≤ n → 3 * n ≤ 7 * f n) ↔
    ∀ s : Finset ℝ², ¬ Collinear ℝ (s : Set ℝ²) →
      3 * s.card ≤ 7 * (ordinaryLines s).card := by
  constructor
  · intro h s hs
    have hn : 3 ≤ s.card := by
      by_contra! hn
      exact hs (collinear_of_card_lt_three hn)
    exact (h s.card hn).trans (Nat.mul_le_mul_left 7 (f_le rfl hs))
  · intro h n hn
    obtain ⟨s, hs, hc, hf⟩ := f_attained hn
    simpa [hs, hf] using h s hc

theorem green_tao_iff : (∀ᶠ n : ℕ in atTop, n ≤ 2 * f n) ↔
    ∃ N : ℕ, 3 ≤ N ∧ ∀ s : Finset ℝ², N ≤ s.card →
      ¬ Collinear ℝ (s : Set ℝ²) → s.card ≤ 2 * (ordinaryLines s).card := by
  constructor
  · intro h
    obtain ⟨N, hN⟩ := eventually_atTop.mp h
    refine ⟨max 3 N, le_max_left _ _, ?_⟩
    intro s hs hc
    exact (hN s.card ((le_max_right _ _).trans hs)).trans
      (Nat.mul_le_mul_left 2 (f_le rfl hc))
  · rintro ⟨N, hN, h⟩
    apply eventually_atTop.mpr
    refine ⟨N, ?_⟩
    intro n hn
    obtain ⟨s, hs, hc, hf⟩ := f_attained (hN.trans hn)
    simpa [hs, hf] using h s (by simpa [hs] using hn) hc

theorem f_unique {n m : ℕ} (hn : 3 ≤ n)
    (hlower : ∀ s : Finset ℝ², s.card = n → ¬ Collinear ℝ (s : Set ℝ²) →
      m ≤ (ordinaryLines s).card)
    (hattain : ∃ s : Finset ℝ², s.card = n ∧ ¬ Collinear ℝ (s : Set ℝ²) ∧
      (ordinaryLines s).card = m) : m = f n := by
  apply Nat.le_antisymm ((le_f_iff hn).mpr hlower)
  obtain ⟨s, hs, hc, hm⟩ := hattain
  simpa [hm] using f_le hs hc

theorem eventually_even_exact
    (hl : ∀ᶠ n : ℕ in atTop, n ≤ 2 * f n)
    (hu : ∀ᶠ n : ℕ in atTop, Even n → 2 * f n ≤ n) :
    ∀ᶠ n : ℕ in atTop, Even n → 2 * f n = n := by
  filter_upwards [hl, hu] with n hl hu
  intro hn
  exact Nat.le_antisymm (hu hn) hl

end Erdos210
