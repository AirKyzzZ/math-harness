import Mathlib

namespace Erdos257

theorem erdos_257_neg :
    ¬ (∀ (A : Set ℕ), A.Infinite → Irrational (∑' n : A, (1 : ℝ) / (2 ^ n.1 - 1))) := by
  sorry

theorem erdos_257.variants.tsum_top_eq :
    ∑' n, 1 / (2 ^ n - 1 : ℝ) = ∑' n, n.divisors.card / (2 ^ n : ℝ) := by
  have hr : ‖(1 / 2 : ℝ)‖ < 1 := by norm_num
  -- The key Lambert-series identity from Mathlib (`k = 0`):
  -- `∑' n:ℕ+, (1/2)^n / (1 - (1/2)^n) = ∑' n:ℕ+, σ 0 n * (1/2)^n`, with summands rewritten.
  have key := tsum_pow_div_one_sub_eq_tsum_sigma (𝕜 := ℝ) hr 0
  have hpos : ∀ n : ℕ, 0 < n → (2 : ℝ) ≤ 2 ^ n := fun n hn ↦ by
    simpa using pow_le_pow_right₀ (by norm_num : (1 : ℝ) ≤ 2) hn
  simp only [pow_zero, one_mul, ArithmeticFunction.sigma_zero_apply,
    show ∀ n : ℕ+, ((1 : ℝ) / 2) ^ (n : ℕ) / (1 - (1 / 2) ^ (n : ℕ))
        = 1 / (2 ^ (n : ℕ) - 1) from fun n ↦ by
      have h := hpos n n.2
      have hp : (0 : ℝ) < 2 ^ (n : ℕ) := by positivity
      have h1 : (1 : ℝ) / 2 ^ (n : ℕ) < 1 := (div_lt_one hp).2 (by linarith)
      rw [div_pow, one_pow, div_eq_div_iff (by linarith) (by linarith)]; field_simp,
    show ∀ n : ℕ+, ((n : ℕ).divisors.card : ℝ) * (1 / 2) ^ (n : ℕ)
        = (n : ℕ).divisors.card / 2 ^ (n : ℕ) from fun n ↦ by
      rw [div_pow, one_pow]; ring] at key
  -- Domination by geometric series gives `ℕ`-summability of both sides.
  have hsummL : Summable fun n : ℕ ↦ 1 / (2 ^ n - 1 : ℝ) :=
    .of_nonneg_of_le
      (fun n ↦ by have := one_le_pow₀ (one_le_two (α := ℝ)) (n := n); apply div_nonneg <;> linarith)
      (fun n ↦ by
        rcases Nat.eq_zero_or_pos n with h | h
        · simp [h]
        · have h2 := hpos n h
          rw [show (2 : ℝ) * (1 / 2) ^ n = 2 / 2 ^ n by rw [div_pow, one_pow]; ring,
            div_le_div_iff₀ (by linarith) (by positivity)]; nlinarith)
      ((summable_geometric_of_norm_lt_one hr).mul_left 2)
  have hsummR : Summable fun n : ℕ ↦ (n.divisors.card : ℝ) / (2 ^ n : ℝ) :=
    .of_nonneg_of_le (fun n ↦ by positivity)
      (fun n ↦ by
        rw [pow_one, show ((1 : ℝ) / 2) ^ n = 1 / 2 ^ n by rw [div_pow, one_pow], mul_one_div]
        gcongr; exact_mod_cast Nat.card_divisors_le_self n)
      (summable_pow_mul_geometric_of_norm_lt_one 1 hr)
  -- Bridge `ℕ+` to `ℕ`: the `n = 0` term is `0` on both sides.
  rw [← (tsum_zero_pnat_eq_tsum_nat hsummL), ← (tsum_zero_pnat_eq_tsum_nat hsummR)]
  simpa using key

end Erdos257
