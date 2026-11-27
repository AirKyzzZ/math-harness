import Mathlib

open Filter Real

namespace Erdos148

noncomputable def F (k : ℕ) : ℕ :=
  {S : Finset ℕ | S.card = k ∧ 0 ∉ S ∧ ∑ n ∈ S, (1 : ℚ) / n = 1}.ncard

def u : ℕ → ℕ
  | 0 => 1
  | n + 1 => u n * (u n + 1)

noncomputable def c₀ : ℝ := ⨆ n : ℕ, (u n : ℝ) ^ ((1 : ℝ) / 2 ^ n)

theorem F_one : F 1 = 1 := by
  have h : {S : Finset ℕ | S.card = 1 ∧ 0 ∉ S ∧ ∑ n ∈ S, (1 : ℚ) / n = 1} =
      {{1}} := by
    ext S
    simp only [Set.mem_ofPred_eq, Set.mem_singleton_iff, Finset.card_eq_one]
    constructor
    · rintro ⟨⟨a, rfl⟩, -, hsum⟩
      simp only [Finset.sum_singleton, one_div, inv_eq_one, Nat.cast_eq_one] at hsum
      rw [hsum]
    · rintro rfl
      exact ⟨⟨1, rfl⟩, by simp, by simp⟩
  rw [F, h, Set.ncard_singleton]

theorem F_two : F 2 = 0 := by
  have h : {S : Finset ℕ | S.card = 2 ∧ 0 ∉ S ∧ ∑ n ∈ S, (1 : ℚ) / n = 1} = ∅ := by
    ext S
    simp only [Set.mem_ofPred_eq, Set.mem_empty_iff_false, iff_false, not_and]
    intro hS h0 hsum
    obtain ⟨x, y, hxy, rfl⟩ := Finset.card_eq_two.mp hS
    simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at h0
    rw [Finset.sum_pair hxy] at hsum
    have hx : (x : ℚ) ≠ 0 := by exact_mod_cast Ne.symm h0.1
    have hy : (y : ℚ) ≠ 0 := by exact_mod_cast Ne.symm h0.2
    rw [div_add_div _ _ hx hy, div_eq_one_iff_eq (mul_ne_zero hx hy)] at hsum
    have e : y + x = x * y := by
      exact_mod_cast (by linear_combination hsum : (y : ℚ) + x = x * y)
    rcases Nat.lt_or_ge x 3 with hx3 | hx3
    · interval_cases x <;> omega
    rcases Nat.lt_or_ge y 3 with hy3 | hy3
    · interval_cases y <;> omega
    nlinarith
  rw [F, h, Set.ncard_empty]

private lemma eq_two_three_six {x y z : ℕ} (hx : 0 < x) (hxy : x < y) (hyz : y < z)
    (h : (1 : ℚ) / x + 1 / y + 1 / z = 1) : x = 2 ∧ y = 3 ∧ z = 6 := by
  have hx' : (x : ℚ) ≠ 0 := by exact_mod_cast hx.ne'
  have hy' : (y : ℚ) ≠ 0 := by exact_mod_cast (by omega : y ≠ 0)
  have hz' : (z : ℚ) ≠ 0 := by exact_mod_cast (by omega : z ≠ 0)
  rw [div_add_div _ _ hx' hy', div_add_div _ _ (mul_ne_zero hx' hy') hz',
    div_eq_one_iff_eq (mul_ne_zero (mul_ne_zero hx' hy') hz')] at h
  have e : y * z + x * z + x * y = x * y * z := by
    exact_mod_cast (by linear_combination h : (y * z + x * z + x * y : ℚ) = x * y * z)
  rcases Nat.lt_or_ge x 3 with hx3 | hx3
  · interval_cases x
    · nlinarith
    · rcases Nat.lt_or_ge y 4 with hy4 | hy4
      · interval_cases y
        exact ⟨rfl, rfl, by omega⟩
      · nlinarith
  · have h1 : x * z < y * z := Nat.mul_lt_mul_of_pos_right hxy (by omega)
    have h2 : x * y < y * z := by nlinarith
    have h3 : 3 * (y * z) ≤ x * (y * z) := Nat.mul_le_mul_right _ hx3
    nlinarith

theorem F_three : F 3 = 1 := by
  have h : {S : Finset ℕ | S.card = 3 ∧ 0 ∉ S ∧ ∑ n ∈ S, (1 : ℚ) / n = 1} =
      {{2, 3, 6}} := by
    ext S
    simp only [Set.mem_ofPred_eq, Set.mem_singleton_iff]
    constructor
    · rintro ⟨hS, h0, hsum⟩
      obtain ⟨x, y, z, hxy, hxz, hyz, rfl⟩ := Finset.card_eq_three.mp hS
      simp only [Finset.mem_insert, Finset.mem_singleton, not_or] at h0
      rw [Finset.sum_insert (by simp [hxy, hxz]), Finset.sum_pair hyz] at hsum
      have hx : 0 < x := by omega
      have hy : 0 < y := by omega
      have hz : 0 < z := by omega
      rcases lt_or_gt_of_ne hxy with h1 | h1 <;> rcases lt_or_gt_of_ne hxz with h2 | h2 <;>
        rcases lt_or_gt_of_ne hyz with h3 | h3
      · obtain ⟨rfl, rfl, rfl⟩ := eq_two_three_six hx h1 h3 (by linarith); decide
      · obtain ⟨rfl, rfl, rfl⟩ := eq_two_three_six hx h2 h3 (by linarith); decide
      · omega
      · obtain ⟨rfl, rfl, rfl⟩ := eq_two_three_six hz h2 h1 (by linarith); decide
      · obtain ⟨rfl, rfl, rfl⟩ := eq_two_three_six hy h1 h2 (by linarith); decide
      · omega
      · obtain ⟨rfl, rfl, rfl⟩ := eq_two_three_six hy h3 h2 (by linarith); decide
      · obtain ⟨rfl, rfl, rfl⟩ := eq_two_three_six hz h3 h1 (by linarith); decide
    · rintro rfl
      refine ⟨by decide, by decide, ?_⟩
      rw [Finset.sum_insert (by decide), Finset.sum_pair (by decide)]
      norm_num
  rw [F, h, Set.ncard_singleton]

theorem F_first_values :
    F 1 = 1 ∧ F 2 = 0 ∧ F 3 = 1 ∧ F 4 = 6 ∧ F 5 = 72 ∧ F 6 = 2320 ∧ F 7 = 245765 ∧
      F 8 = 151182379 := by
  refine ⟨F_one, F_two, F_three, ?_⟩
  sorry

theorem u_first_values : u 0 = 1 ∧ u 1 = 2 ∧ u 2 = 6 ∧ u 3 = 42 ∧ u 4 = 1806 := by
  decide

theorem erdos_148.variants.upper_bound :
    ∃ o : ℕ → ℝ, o =o[atTop] (1 : ℕ → ℝ) ∧ ∀ᶠ k : ℕ in atTop, (F k : ℝ) ≤ c₀ ^ ((1 / 5 + o k) * 2 ^ k) := by
  sorry

end Erdos148
