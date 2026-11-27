import Mathlib

open Filter

open scoped ArithmeticFunction.sigma

namespace Erdos420

noncomputable def F (f : ℕ → ℝ) (n : ℕ) : ℝ :=
  (σ 0 (n + ⌊f n⌋₊).factorial : ℝ) / (σ 0 n.factorial : ℝ)

theorem F_eq_one_of_lt_one {f : ℕ → ℝ} {n : ℕ} (hf : f n < 1) : F f n = 1 := by
  have h : (σ 0 n.factorial : ℝ) ≠ 0 := by
    exact_mod_cast (ArithmeticFunction.sigma_pos 0 _ (Nat.factorial_ne_zero n)).ne'
  rw [F, Nat.floor_eq_zero.2 hf, add_zero, div_self h]

theorem one_le_F (f : ℕ → ℝ) (n : ℕ) : 1 ≤ F f n := by
  have h0 : (0 : ℝ) < σ 0 n.factorial := by
    exact_mod_cast ArithmeticFunction.sigma_pos 0 _ (Nat.factorial_ne_zero n)
  rw [F, one_le_div h0]
  simp only [ArithmeticFunction.sigma_zero_apply]
  exact_mod_cast Finset.card_le_card (Nat.divisors_subset_of_dvd (Nat.factorial_ne_zero _)
    (Nat.factorial_dvd_factorial (Nat.le_add_right n _)))

theorem F_one_of_prime {n : ℕ} (hn : (n + 1).Prime) : F (fun _ ↦ 1) n = 2 := by
  have hcop : Nat.Coprime (n + 1) n.factorial :=
    (Nat.Prime.coprime_iff_not_dvd hn).2 fun h ↦ by
      have := (Nat.Prime.dvd_factorial hn).1 h
      omega
  have h0 : (σ 0 n.factorial : ℝ) ≠ 0 := by
    exact_mod_cast (ArithmeticFunction.sigma_pos 0 _ (Nat.factorial_ne_zero n)).ne'
  have hp : σ 0 (n + 1) = 2 := by
    simpa using ArithmeticFunction.sigma_zero_apply_prime_pow (i := 1) hn
  simp only [F, Nat.floor_one, Nat.factorial_succ,
    ArithmeticFunction.isMultiplicative_sigma.map_mul_of_coprime hcop, hp]
  push_cast
  field_simp

theorem erdos_420.variants.pow_four_ninths :
    ∀ᶠ n : ℕ in atTop, 2 ≤ F (fun m ↦ (m : ℝ) ^ (4 / 9 : ℝ)) n := by
  sorry

end Erdos420
