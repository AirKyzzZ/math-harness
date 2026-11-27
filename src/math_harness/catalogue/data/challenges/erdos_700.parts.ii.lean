import Mathlib

namespace Erdos700

open Finset

noncomputable def f (n : ℕ) : ℕ :=
  sInf {m | ∃ k, 1 < k ∧ k ≤ n / 2 ∧ m = Nat.gcd n (n.choose k)}

noncomputable def P (n : ℕ) : ℕ := n.primeFactors.sup id

noncomputable def Q (n : ℕ) : ℕ := n.primeFactors.sup (fun p => p ^ n.factorization p)

def fSet (n : ℕ) : Set ℕ := {m | ∃ k, 1 < k ∧ k ≤ n / 2 ∧ m = Nat.gcd n (n.choose k)}

lemma f_eq (n : ℕ) : f n = sInf (fSet n) := rfl

lemma f_mem (n k : ℕ) (h1 : 1 < k) (h2 : k ≤ n / 2) :
    Nat.gcd n (n.choose k) ∈ fSet n := ⟨k, h1, h2, rfl⟩

lemma f_le (n k : ℕ) (h1 : 1 < k) (h2 : k ≤ n / 2) :
    f n ≤ Nat.gcd n (n.choose k) := Nat.sInf_le (f_mem n k h1 h2)

theorem prime_power_divisor_separation : f 12 = 3 ∧ 12 / P 12 = 4 ∧ 12 / Q 12 = 3 := by
  refine ⟨le_antisymm ?_ ?_, ?_, ?_⟩
  · exact f_le 12 4 (by decide) (by decide)
  · have hne : (fSet 12).Nonempty := ⟨_, f_mem 12 4 (by decide) (by decide)⟩
    obtain ⟨k, hk1, hk2, hkeq⟩ := Nat.sInf_mem hne
    rw [f_eq, hkeq]
    interval_cases k <;> decide
  · unfold P
    decide +kernel
  · unfold Q
    decide +kernel

theorem erdos_700.parts.ii :
    {n : ℕ | ¬ n.Prime ∧ 1 < n ∧ (f n) ^ 2 > n}.Infinite := by
  sorry

lemma prime_dvd_of_not_dvd_choose (P n k : ℕ) (hP : P.Prime) (hPn : P ∣ n)
    (h : ¬ P ∣ n.choose k) : P ∣ k := by
  have := Fact.mk hP
  by_contra hk
  apply h
  have hmod : n.choose k ≡ (n % P).choose (k % P) * (n / P).choose (k / P) [MOD P] :=
    Choose.choose_modEq_choose_mod_mul_choose_div_nat
  have hn0 : n % P = 0 := by
    have h := (Nat.modEq_zero_iff_dvd).2 hPn; simpa [Nat.ModEq, Nat.zero_mod] using h
  have hkP : 0 < k % P := Nat.pos_of_ne_zero (fun hh => hk (Nat.dvd_of_mod_eq_zero hh))
  rw [hn0, Nat.choose_eq_zero_of_lt hkP, zero_mul] at hmod
  exact (Nat.modEq_zero_iff_dvd).1 hmod

theorem erdos_700.variants.prime_pow (p a : ℕ) (hp : p.Prime) (ha : 2 ≤ a) : f (p ^ a) = p := by
  have hp2 : 2 ≤ p := hp.two_le
  set k := p ^ (a - 1) with hk
  have hk0 : k ≠ 0 := (pow_pos hp.pos _).ne'
  have hkn : k ≤ p ^ a := Nat.pow_le_pow_right hp.pos (by omega)
  have hk1 : 1 < k := by
    calc 1 < p := hp.one_lt
      _ ≤ k := Nat.le_self_pow (by omega) p
  have hk2 : k ≤ p ^ a / 2 := by
    have hpa : p ^ a = p * k := by rw [hk, ← pow_succ']; congr 1; omega
    have : 2 * k ≤ p ^ a := by rw [hpa]; exact Nat.mul_le_mul_right _ hp2
    omega
  have hknne : k ≠ p ^ a := by
    rw [hk]; intro h; exact absurd (Nat.pow_right_injective hp2 h) (by omega)
  have hcpos : 0 < (p ^ a).choose k := Nat.choose_pos hkn
  have hkfact : k.factorization p = a - 1 := by
    rw [hk, Nat.factorization_pow, Nat.Prime.factorization hp]; simp
  have hvp : ((p ^ a).choose k).factorization p = 1 := by
    rw [Nat.factorization_choose_prime_pow hp hkn hk0, hkfact]; omega
  have hgcd : Nat.gcd (p ^ a) ((p ^ a).choose k) = p := by
    obtain ⟨j, hja, hjeq⟩ := (Nat.dvd_prime_pow hp).1 (Nat.gcd_dvd_left (p ^ a) ((p ^ a).choose k))
    have hpC : p ∣ (p ^ a).choose k := hp.dvd_choose_pow hk0 hknne
    have hpg : p ∣ p ^ j := by
      rw [← hjeq]; exact Nat.dvd_gcd (dvd_pow_self p (by omega)) hpC
    have hp2C : ¬ (p ^ 2 ∣ (p ^ a).choose k) := by
      rw [hp.pow_dvd_iff_le_factorization hcpos.ne', hvp]; omega
    have hp2g : ¬ (p ^ 2 ∣ p ^ j) := by
      rw [← hjeq]; exact fun h => hp2C (h.trans (Nat.gcd_dvd_right _ _))
    have hj1 : 1 ≤ j := by
      rcases Nat.eq_zero_or_pos j with rfl | hj0
      · rw [pow_zero, Nat.dvd_one] at hpg; omega
      · exact hj0
    have hj2 : j ≤ 1 := by
      by_contra! h
      exact hp2g ((Nat.pow_dvd_pow_iff_le_right hp.one_lt).2 h)
    rw [hjeq, show j = 1 from by omega, pow_one]
  have hle : f (p ^ a) ≤ p := by
    have hh := f_le (p ^ a) k hk1 hk2; rwa [hgcd] at hh
  have hge : p ≤ f (p ^ a) := by
    have hne : (fSet (p ^ a)).Nonempty := ⟨_, f_mem (p ^ a) k hk1 hk2⟩
    obtain ⟨j, hj1, hj2, hjeq⟩ := Nat.sInf_mem hne
    have hjne : j ≠ p ^ a := by rintro rfl; omega
    have hpdvd : p ∣ Nat.gcd (p ^ a) ((p ^ a).choose j) :=
      Nat.dvd_gcd (dvd_pow_self p (by omega)) (hp.dvd_choose_pow (by omega) hjne)
    calc p ≤ Nat.gcd (p ^ a) ((p ^ a).choose j) :=
            Nat.le_of_dvd (Nat.gcd_pos_of_pos_left _ (pow_pos hp.pos a)) hpdvd
      _ = sInf (fSet (p ^ a)) := hjeq.symm
      _ = f (p ^ a) := (f_eq _).symm
  omega

theorem erdos_700.variants.prime_mul (p q : ℕ) (hp : p.Prime) (hq : q.Prime) (hpq : p < q) :
    f (p * q) = p := by
  have := Fact.mk hp
  have := Fact.mk hq
  have hp2 : 2 ≤ p := hp.two_le
  have hq2 : 2 ≤ q := hq.two_le
  have hpndq : ¬ p ∣ q := fun h => by
    have := (Nat.prime_dvd_prime_iff_eq hp hq).1 h; omega
  have hk1 : 1 < q := by omega
  have hk2 : q ≤ p * q / 2 := by
    have : 2 * q ≤ p * q := by nlinarith
    omega
  have hpC : p ∣ (p * q).choose q := by
    by_contra h
    exact hpndq (prime_dvd_of_not_dvd_choose p (p * q) q hp ⟨q, rfl⟩ h)
  have hqC : ¬ q ∣ (p * q).choose q := by
    have hmod : (p * q).choose q ≡
        ((p * q) % q).choose (q % q) * ((p * q) / q).choose (q / q) [MOD q] :=
      Choose.choose_modEq_choose_mod_mul_choose_div_nat
    rw [Nat.mul_mod_left, Nat.mod_self, Nat.choose_zero_right,
        Nat.mul_div_cancel _ (by omega : 0 < q), Nat.div_self (by omega : 0 < q),
        Nat.choose_one_right, one_mul] at hmod
    intro hdvd
    have h0 : (p * q).choose q ≡ 0 [MOD q] := (Nat.modEq_zero_iff_dvd).2 hdvd
    have hp0 : q ∣ p := (Nat.modEq_zero_iff_dvd).1 (hmod.symm.trans h0)
    have := Nat.le_of_dvd (by omega) hp0
    omega
  have hgcd : Nat.gcd (p * q) ((p * q).choose q) = p := by
    have hpg : p ∣ Nat.gcd (p * q) ((p * q).choose q) := Nat.dvd_gcd ⟨q, rfl⟩ hpC
    obtain ⟨e, he⟩ := hpg
    have hgdvd : Nat.gcd (p * q) ((p * q).choose q) ∣ p * q := Nat.gcd_dvd_left _ _
    rw [he] at hgdvd
    have hedvd : e ∣ q := (Nat.mul_dvd_mul_iff_left (by omega : 0 < p)).1 hgdvd
    rcases (Nat.Prime.eq_one_or_self_of_dvd hq e hedvd) with he1 | heq
    · rw [he, he1, mul_one]
    · exfalso
      have hqg : q ∣ Nat.gcd (p * q) ((p * q).choose q) := by rw [he, heq]; exact ⟨p, by ring⟩
      exact hqC (hqg.trans (Nat.gcd_dvd_right _ _))
  have hle : f (p * q) ≤ p := by have := f_le (p * q) q hk1 hk2; rwa [hgcd] at this
  have hge : p ≤ f (p * q) := by
    have hne : (fSet (p * q)).Nonempty := ⟨_, f_mem (p * q) q hk1 hk2⟩
    obtain ⟨k, hk1', hk2', hkeq⟩ := Nat.sInf_mem hne
    rw [f_eq, hkeq]
    set g := Nat.gcd (p * q) ((p * q).choose k) with hgdef
    have hgpos : 0 < g := Nat.gcd_pos_of_pos_left _ (by positivity)
    have hg1 : g ≠ 1 := by
      intro hg
      have hpnd : ¬ p ∣ (p * q).choose k := fun hd => by
        have : p ∣ g := Nat.dvd_gcd ⟨q, rfl⟩ hd
        rw [hg] at this; exact absurd (Nat.le_of_dvd one_pos this) (by omega)
      have hqnd : ¬ q ∣ (p * q).choose k := fun hd => by
        have : q ∣ g := Nat.dvd_gcd ⟨p, by ring⟩ hd
        rw [hg] at this; exact absurd (Nat.le_of_dvd one_pos this) (by omega)
      have hpk : p ∣ k := prime_dvd_of_not_dvd_choose p (p * q) k hp ⟨q, rfl⟩ hpnd
      have hqk : q ∣ k := prime_dvd_of_not_dvd_choose q (p * q) k hq ⟨p, by ring⟩ hqnd
      have hpqk : p * q ∣ k := Nat.Coprime.mul_dvd_of_dvd_of_dvd
        ((Nat.coprime_primes hp hq).2 (by omega)) hpk hqk
      have hkpos : 0 < k := by omega
      have h1 : p * q ≤ k := Nat.le_of_dvd hkpos hpqk
      have h2 : k ≤ p * q / 2 := hk2'
      omega
    have hgdvd : g ∣ p * q := Nat.gcd_dvd_left _ _
    obtain ⟨P, hP, hPg⟩ := Nat.exists_prime_and_dvd hg1
    have hPpq : P ∣ p * q := hPg.trans hgdvd
    have hPpq2 : P = p ∨ P = q := by
      rcases (hP.dvd_mul.1 hPpq) with h | h
      · exact Or.inl ((Nat.prime_dvd_prime_iff_eq hP hp).1 h)
      · exact Or.inr ((Nat.prime_dvd_prime_iff_eq hP hq).1 h)
    have hPge : p ≤ P := by rcases hPpq2 with rfl | rfl <;> omega
    have hPleg : P ≤ g := Nat.le_of_dvd hgpos hPg
    omega
  omega

end Erdos700
