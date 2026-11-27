import Mathlib

namespace Erdos365

theorem golomb_pair :
    Nat.Powerful 12167 ∧ Nat.Powerful 12168 ∧
      ¬ IsSquare (12167 : ℕ) ∧ ¬ IsSquare (12168 : ℕ) := by
  have hA : Nat.Powerful 12167 := by
    intro p hp
    obtain ⟨hp, hd, _⟩ := Nat.mem_primeFactors.mp hp
    have hpow : p ∣ (23 : ℕ) ^ 3 := by norm_num at hd ⊢; exact hd
    have heq : p = 23 := Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) hpow
    subst p
    norm_num
  have hB : Nat.Powerful 12168 := by
    intro p hp
    obtain ⟨hp, hd, _⟩ := Nat.mem_primeFactors.mp hp
    have hprod : p ∣ (2 : ℕ) ^ 3 * 3 ^ 2 * 13 ^ 2 := by norm_num at hd ⊢; exact hd
    rcases hp.dvd_mul.mp hprod with hab | hc
    · rcases hp.dvd_mul.mp hab with ha | hb
      · have heq : p = 2 := Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) ha
        subst p
        norm_num
      · have heq : p = 3 := Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) hb
        subst p
        norm_num
    · have heq : p = 13 := Nat.prime_eq_prime_of_dvd_pow hp (by norm_num) hc
      subst p
      norm_num
  have hns : ∀ n : ℕ, 12100 < n → n < 12321 → ¬ IsSquare n := by
    intro n hlo hhi ⟨r, hr⟩
    have hrlo : 110 < r := by nlinarith
    have hrhi : r < 111 := by nlinarith
    omega
  exact ⟨hA, hB, hns _ (by norm_num) (by norm_num), hns _ (by norm_num) (by norm_num)⟩

theorem erdos_365.parts.i :
    ¬ ∀ n : ℕ, 0 < n → Nat.Powerful n → Nat.Powerful (n + 1) →
      IsSquare n ∨ IsSquare (n + 1) := by
  intro h
  obtain ⟨hA, hB, hnA, hnB⟩ := golomb_pair
  rcases h 12167 (by norm_num) hA hB with hs | hs
  · exact hnA hs
  · exact hnB hs

theorem erdos_365.parts.ii_neg :
    ¬ (∃ C : ℝ, 0 < C ∧ ∃ k : ℕ, ∀ᶠ x : ℕ in Filter.atTop, ({n : ℕ | 0 < n ∧ n ≤ x ∧ Nat.Powerful n ∧ Nat.Powerful (n + 1)}.ncard : ℝ) ≤ C * (Real.log x) ^ k) := by
  sorry

end Erdos365
