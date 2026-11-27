import Mathlib

namespace Erdos649

theorem erdos_649.variants.no_solution_two_seven :
    ¬ ∃ n : ℕ, n.maxPrimeFac = 2 ∧ (n + 1).maxPrimeFac = 7 := by
  rintro ⟨n, hn, hn'⟩
  have h1n : 1 < n := by
    have := (Nat.one_lt_maxPrimeFac_iff n).mp (by omega)
    omega
  -- Since `2` is the greatest prime factor of `n`, it is the only one, so `n` is a power of `2`.
  obtain ⟨k, hpow⟩ : ∃ k, n = 2 ^ k :=
    ⟨_, Nat.eq_prime_pow_of_unique_prime_dvd (by omega)
      (fun {q} hq hqd ↦
        le_antisymm (hn ▸ Nat.le_maxPrimeFac (by omega) hq hqd) hq.two_le)⟩
  -- On the other hand `7` divides `n + 1`, i.e. `2 ^ k ≡ -1 (mod 7)`.
  have h7 : 7 ∣ n + 1 := hn' ▸ Nat.maxPrimeFac_dvd
  -- This is impossible: `2 ^ k` is congruent to `1`, `2` or `4` modulo `7`, never to `6`.
  have hmod : 2 ^ k % 7 = 2 ^ (k % 3) % 7 := by
    conv_lhs => rw [← Nat.div_add_mod k 3, pow_add, pow_mul]
    rw [Nat.mul_mod, Nat.pow_mod]
    norm_num
  have hk3 : k % 3 < 3 := Nat.mod_lt _ (by norm_num)
  interval_cases h : k % 3 <;> omega

theorem erdos_649.variants.tong_question_neg :
    ¬ (∀ q : ℕ, q.Prime → Odd q → {p : ℕ | p.Prime ∧ ¬ ∃ n : ℕ, n.maxPrimeFac = p ∧ (n + 1).maxPrimeFac = q}.Infinite) := by
  sorry

theorem erdos_649.variants.sampaio :
    ¬ ∃ n : ℕ, n.maxPrimeFac = 19 ∧ (n + 1).maxPrimeFac = 2 := by
  rintro ⟨n, hn, hn'⟩
  have hn0 : n ≠ 0 := by
    rintro rfl
    simp at hn
  -- Since `2` is the greatest prime factor of `n + 1`, it is the only one, so `n + 1` is a power
  -- of `2`.
  obtain ⟨k, hpow⟩ : ∃ k, n + 1 = 2 ^ k :=
    ⟨_, Nat.eq_prime_pow_of_unique_prime_dvd (by omega)
      (fun {q} hq hqd ↦
        le_antisymm (hn' ▸ Nat.le_maxPrimeFac (by omega) hq hqd) hq.two_le)⟩
  -- On the other hand `19` divides `n`, i.e. `2 ^ k ≡ 1 (mod 19)`.
  have h19 : 19 ∣ n := hn ▸ Nat.maxPrimeFac_dvd
  -- Modulo `2 ^ 18 - 1`, which both `19` and `73` divide, `2 ^ k` depends only on `k % 18`.
  have hmod : 2 ^ k % (2 ^ 18 - 1) = 2 ^ (k % 18) % (2 ^ 18 - 1) := by
    conv_lhs => rw [← Nat.div_add_mod k 18, pow_add, pow_mul]
    rw [Nat.mul_mod, Nat.pow_mod]
    norm_num
  -- As `2` is a primitive root modulo `19`, this forces `18 ∣ k`, and then `73 ∣ 2 ^ 18 - 1 ∣ n`.
  have h73 : 73 ∣ n := by
    have hk : k % 18 < 18 := Nat.mod_lt _ (by norm_num)
    interval_cases h : k % 18 <;> omega
  -- But `73` is a prime factor of `n` larger than `19`.
  have := hn ▸ Nat.le_maxPrimeFac hn0 (by norm_num) h73
  omega

end Erdos649
