import Mathlib

open Filter

open scoped ArithmeticFunction.omega

namespace Erdos685

noncomputable def primeRecipSum (k n : ℕ) : ℝ :=
  ∑ p ∈ (Finset.Ioo k n).filter Nat.Prime, (1 : ℝ) / p

theorem primeRecipSum_two_five : primeRecipSum 2 5 = 1 / 3 := by
  rw [primeRecipSum, show (Finset.Ioo 2 5).filter Nat.Prime = {3} by decide]
  norm_num

theorem erdos_685.parts.ii_neg :
    ¬ (∃ c > (0 : ℝ), ∀ ε > (0 : ℝ), ∀ δ > (0 : ℝ), ∀ᶠ n : ℕ in atTop, ∀ k : ℕ, Real.log (n : ℝ) ^ c ≤ (k : ℝ) → (k : ℝ) ≤ (n : ℝ) ^ (1 - ε) → |(ω (n.choose k) : ℝ) - (k : ℝ) * primeRecipSum k n| ≤ δ * ((k : ℝ) * primeRecipSum k n)) := by
  sorry

theorem erdos_685.variants.trivial_lower_bound :
    ∀ n k : ℕ, 0 < k → k < n →
      Real.log (n.choose k : ℝ) / Real.log (n : ℝ) ≤ (ω (n.choose k) : ℝ) := by
  intro n k hk0 hkn
  have hn : 1 < n := by omega
  have hchoose : n.choose k ≤ n ^ (ω (n.choose k)) := by
    have hc : (n.choose k).primeFactors.card = ω (n.choose k) := by
      simp only [Nat.primeFactors, List.card_toFinset, ArithmeticFunction.cardDistinctFactors_apply]
    calc
      n.choose k = ∏ p ∈ (n.choose k).primeFactors,
          p ^ (n.choose k).factorization p :=
        Nat.prod_primeFactors_pow_factorization (Nat.choose_ne_zero hkn.le)
      _ ≤ ∏ _p ∈ (n.choose k).primeFactors, n :=
        Finset.prod_le_prod' fun _ _ => Nat.pow_factorization_choose_le (by omega)
      _ = n ^ (ω (n.choose k)) := by simp [hc]
  have hp : 0 < Real.log (n : ℝ) := Real.log_pos (by exact_mod_cast hn)
  apply (div_le_iff₀ hp).mpr
  have hpow : (n.choose k : ℝ) ≤ (n : ℝ) ^ (ω (n.choose k)) := by
    exact_mod_cast hchoose
  have hlog := Real.log_le_log (Nat.cast_pos.mpr (Nat.choose_pos hkn.le)) hpow
  simpa only [Real.log_pow] using hlog

end Erdos685
