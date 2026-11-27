import Mathlib

open Filter

namespace Erdos382

def LargestPrimeRepeated (u v : ℕ) : Prop :=
  1 ≤ u ∧ u ≤ v ∧ 2 ≤ v ∧
    Nat.maxPrimeFac (∏ m ∈ Finset.Icc u v, m) ^ 2 ∣ ∏ m ∈ Finset.Icc u v, m

theorem largestPrimeRepeated_48_50 : LargestPrimeRepeated 48 50 := by
  unfold LargestPrimeRepeated
  decide +kernel

theorem lt_two_mul_of_largestPrimeRepeated {u v : ℕ} (h : LargestPrimeRepeated u v) :
    v < 2 * u := by
  obtain ⟨hu, -, hv, hdvd⟩ := h
  by_contra! hle
  have hP0 : ∏ m ∈ Finset.Icc u v, m ≠ 0 :=
    Finset.prod_ne_zero_iff.2 fun m hm ↦ by have := (Finset.mem_Icc.1 hm).1; omega
  -- Bertrand's postulate gives a prime `q` with `v / 2 < q ≤ v`, so `u ≤ q ≤ v`.
  obtain ⟨q, hq, hq1, hq2⟩ := Nat.exists_prime_lt_and_le_two_mul (v / 2) (by omega)
  have hqP : q ∣ ∏ m ∈ Finset.Icc u v, m :=
    Finset.dvd_prod_of_mem _ (Finset.mem_Icc.2 ⟨by omega, by omega⟩)
  have hP1 : 1 < ∏ m ∈ Finset.Icc u v, m :=
    lt_of_lt_of_le hq.one_lt (Nat.le_of_dvd (Nat.pos_of_ne_zero hP0) hqP)
  -- The largest prime factor `p` satisfies `q ≤ p`, so `v < 2 * p`.
  set p := Nat.maxPrimeFac (∏ m ∈ Finset.Icc u v, m)
  have hp : p.Prime := Nat.prime_maxPrimeFac_of_one_lt _ hP1
  have hpq : q ≤ p := Nat.le_maxPrimeFac hP0 hq hqP
  have hv2 : v < 2 * p := by omega
  -- Hence `p` is the only multiple of `p` in `[u, v]`.
  have key : ∀ m ∈ Finset.Icc u v, p ∣ m → m = p := by
    rintro m hm ⟨k, rfl⟩
    have hm' := Finset.mem_Icc.1 hm
    rcases Nat.lt_or_ge k 2 with hk | hk
    · interval_cases k <;> omega
    · have := Nat.mul_le_mul_left p hk
      linarith [hm'.2]
  have hpmem : p ∈ Finset.Icc u v := by
    obtain ⟨m, hm, hpm⟩ := (Prime.dvd_finsetProd_iff hp.prime _).1
      (Nat.maxPrimeFac_dvd (n := ∏ m ∈ Finset.Icc u v, m))
    rwa [← key m hm hpm]
  -- Write the product as `p * R`. Then `p ^ 2` divides it only if `p ∣ R`, which is impossible.
  rw [← Finset.mul_prod_erase _ _ hpmem, pow_two] at hdvd
  obtain ⟨m, hm, hpm⟩ := (Prime.dvd_finsetProd_iff hp.prime _).1
    ((mul_dvd_mul_iff_left hp.ne_zero).1 hdvd)
  exact (Finset.mem_erase.1 hm).1 (key m (Finset.mem_of_mem_erase hm) hpm)

theorem erdos_382.variants.ramachandra :
    ∀ ε > (0 : ℝ), ∀ᶠ v : ℕ in atTop, ∀ u : ℕ, LargestPrimeRepeated u v → ((v - u : ℕ) : ℝ) ≤ (v : ℝ) ^ ((1 : ℝ) / 2 + ε) := by
  sorry

end Erdos382
