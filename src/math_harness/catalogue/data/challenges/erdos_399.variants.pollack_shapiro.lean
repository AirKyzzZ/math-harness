import Mathlib

open Nat

namespace Erdos399

theorem erdos_399 :
    ∃ (n x y k : ℕ), 1 < x * y ∧ 2 < k ∧ (n ! = x ^ k + y ^ k ∨ n ! + y ^ k = x ^ k) := by
  exact ⟨10, 48, 36, 4, by decide⟩

theorem erdos_399.variants.pollack_shapiro (n x : ℕ) :
    n ! + 1 ≠ x ^ 4 := by
  sorry

theorem erdos_399.variants.cambie {n x y : ℕ} :
    x.Coprime y → 1 < x * y → n ! ≠ x ^ 4 + y ^ 4 := by
  intro hxy h1 heq
  rcases Nat.lt_or_ge n 4 with hn | hn
  · -- n ≤ 3: n! ≤ 6, but x*y > 1 forces max x y ≥ 2, so x^4 + y^4 ≥ 16.
    have hfact_le : n ! ≤ 6 := by
      interval_cases n <;> decide
    have hxy2 : 2 ≤ x ∨ 2 ≤ y := by
      by_contra hc
      simp only [not_or, not_le] at hc
      obtain ⟨hx, hy⟩ := hc
      interval_cases x <;> interval_cases y <;> omega
    have hbig : 16 ≤ x ^ 4 + y ^ 4 := by
      rcases hxy2 with hx | hy
      · have h16 : (2 : ℕ) ^ 4 ≤ x ^ 4 := Nat.pow_le_pow_left hx 4
        omega
      · have h16 : (2 : ℕ) ^ 4 ≤ y ^ 4 := Nat.pow_le_pow_left hy 4
        omega
    omega
  · -- 4 ≤ n: 8 ∣ n!, but coprimality ⇒ not both even ⇒ (x^4 + y^4) % 8 ∈ {1,2}.
    have h4le : (4 : ℕ) ! ∣ n ! := Nat.factorial_dvd_factorial hn
    have h8 : (8 : ℕ) ∣ n ! := dvd_trans (by decide) h4le
    have h8' : (8 : ℕ) ∣ (x ^ 4 + y ^ 4) := by rw [← heq]; exact h8
    have hnotboth2 : x % 2 = 1 ∨ y % 2 = 1 := by
      by_contra hc
      simp only [not_or] at hc
      obtain ⟨hx0, hy0⟩ := hc
      have hx0' : x % 2 = 0 := by omega
      have hy0' : y % 2 = 0 := by omega
      have hx2 : (2 : ℕ) ∣ x := Nat.dvd_of_mod_eq_zero hx0'
      have hy2 : (2 : ℕ) ∣ y := Nat.dvd_of_mod_eq_zero hy0'
      have hg : (2 : ℕ) ∣ Nat.gcd x y := Nat.dvd_gcd hx2 hy2
      rw [(hxy : Nat.gcd x y = 1)] at hg
      norm_num at hg
    have parity4 : ∀ z : ℕ, z ^ 4 % 8 = z % 2 := by
      intro z
      rcases Nat.even_or_odd z with ⟨k, hk⟩ | ⟨k, hk⟩
      · subst hk
        have heqz : (k + k) ^ 4 = 8 * (2 * k ^ 4) := by ring
        rw [heqz]; omega
      · subst hk
        have heqz : (2 * k + 1) ^ 4 = 8 * (2 * k ^ 4 + 4 * k ^ 3 + 3 * k ^ 2 + k) + 1 := by ring
        rw [heqz]; omega
    have hx4 := parity4 x
    have hy4 := parity4 y
    omega

end Erdos399
