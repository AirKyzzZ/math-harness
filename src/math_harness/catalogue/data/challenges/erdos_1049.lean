import Mathlib

namespace Erdos1049

open ArithmeticFunction Filter

theorem erdos_1049 :
    ∀ t : ℚ, t > 1 → Irrational (∑' n : ℕ+, 1 / ((t : ℝ) ^ (n : ℕ) - 1)) := by
  sorry

private lemma lambert_convergent (t : ℝ) (ht : 1 < |t|) :
    ∑' n : ℕ+, 1 / (t ^ (n : ℕ) - 1) =
    ∑' n : ℕ+, ((n : ℕ).divisors.card : ℝ) / (t ^ (n : ℕ)) := by
  -- `|t| > 1` implies `t ≠ 0`, hence `t^n ≠ 0` for all n.
  have ht0 : t ≠ 0 := fun h => by subst h; simp at ht; linarith [abs_nonneg (0:ℝ)]
  have htn : ∀ n : ℕ, t ^ n ≠ 0 := fun n => pow_ne_zero n ht0
  -- Substitution `r := t⁻¹`, so `|r| < 1`.
  set r : ℝ := t⁻¹ with hr_def
  have hr_norm : ‖r‖ < 1 := by
    rw [Real.norm_eq_abs, hr_def, abs_inv]; exact inv_lt_one_of_one_lt₀ ht
  -- Apply the Mathlib identity. Now reduce each side of our goal to its form.
  have h := tsum_pow_div_one_sub_eq_tsum_sigma (k := 0) hr_norm
  convert h using 1
  -- LHS: show `1 / (t^n - 1) = r^n / (1 - r^n)`. After substituting `r = 1/t`,
  -- this is the algebraic identity `1/(t^n - 1) = (1/t^n) / (1 - 1/t^n)`,
  -- valid when `t^n ≠ 0` and `t^n ≠ 1`.
  · apply tsum_congr; intro n
    have hp : t ^ (n : ℕ) ≠ 0 := htn n
    have hrn : r ^ (n : ℕ) = (t ^ (n : ℕ))⁻¹ := by rw [hr_def, inv_pow]
    -- `t^n ≠ 1`: would imply `|t|^n = 1`, but `|t| > 1` gives `|t|^n > 1` since `n ≥ 1`.
    have hne1 : t ^ (n : ℕ) - 1 ≠ 0 := by
      intro hc
      have ht1 : t ^ (n : ℕ) = 1 := by linarith [sub_eq_zero.mp hc]
      have habs1 : |t| ^ (n : ℕ) = 1 := by rw [← abs_pow, ht1]; simp
      have hlt : 1 < |t| ^ (n : ℕ) := one_lt_pow₀ ht n.pos.ne'
      linarith
    rw [hrn]; field_simp
  -- RHS: `σ_0(n) · r^n = τ(n) / t^n` since `σ_0 = τ` and `r = 1/t`.
  · apply tsum_congr; intro n
    have hp : t ^ (n : ℕ) ≠ 0 := htn n
    have hrn : r ^ (n : ℕ) = (t ^ (n : ℕ))⁻¹ := by rw [hr_def, inv_pow]
    rw [hrn, ArithmeticFunction.sigma_zero_apply]; field_simp

private lemma lambert_divergent (t : ℝ) (ht : |t| ≤ 1) :
    ∑' n : ℕ+, 1 / (t ^ (n : ℕ) - 1) =
    ∑' n : ℕ+, ((n : ℕ).divisors.card : ℝ) / (t ^ (n : ℕ)) := by
  -- `key`: a function with infinitely many terms bounded away from zero is
  -- not summable. Standard contrapositive of `Summable.tendsto_cofinite_zero`.
  have key : ∀ (f : ℕ+ → ℝ) (c : ℝ), 0 < c →
      Set.Infinite {n : ℕ+ | c ≤ |f n|} → ¬Summable f := by
    intro f c hc hinf hsum
    have h := hsum.tendsto_cofinite_zero
    rw [Metric.tendsto_nhds] at h
    have h1 := h c hc
    rw [Filter.eventually_cofinite] at h1
    refine hinf (h1.subset fun n hn => ?_)
    simp only [Set.mem_ofPred_eq, Real.dist_eq, sub_zero, not_lt]
    exact hn
  -- Number of divisors of `n ∈ ℕ+` is at least 1 (since `1 ∈ n.divisors`).
  have hcard_pos : ∀ (n : ℕ+), (1 : ℝ) ≤ ((n : ℕ).divisors.card : ℝ) := by
    intro n
    have : 0 < (n : ℕ).divisors.card := by
      apply Finset.card_pos.mpr
      exact ⟨1, Nat.one_mem_divisors.mpr n.2.ne'⟩
    exact_mod_cast this
  -- Case t = 1: LHS terms are 1/0 = 0 by Lean's convention, so LHS sum = 0.
  -- RHS terms are τ(n)/1 = τ(n) ≥ 1, so RHS is non-summable.
  by_cases ht1 : t = 1
  · subst ht1
    have hLzero : ∀ n : ℕ+, (1 : ℝ) / ((1 : ℝ) ^ (n : ℕ) - 1) = 0 := by intro n; simp
    rw [tsum_congr hLzero, tsum_zero]
    symm; apply tsum_eq_zero_of_not_summable
    apply key _ 1 (by norm_num)
    convert Set.infinite_univ (α := ℕ+)
    ext n
    simp only [one_pow, div_one, Set.mem_ofPred_eq, Set.mem_univ, iff_true]
    rw [abs_of_nonneg (by positivity)]; exact hcard_pos n
  -- Case t = 0: RHS terms are τ(n)/0 = 0 by Lean's convention, so RHS sum = 0.
  -- LHS terms are 1/(0 - 1) = -1, so LHS is non-summable.
  by_cases ht0 : t = 0
  · subst ht0
    have hRzero : ∀ n : ℕ+, ((n : ℕ).divisors.card : ℝ) / ((0 : ℝ) ^ (n : ℕ)) = 0 := by
      intro n; rw [zero_pow n.pos.ne']; simp
    rw [tsum_congr hRzero, tsum_zero]
    apply tsum_eq_zero_of_not_summable
    apply key _ 1 (by norm_num)
    convert Set.infinite_univ (α := ℕ+)
    ext n
    simp only [zero_pow n.pos.ne', zero_sub, Set.mem_ofPred_eq, Set.mem_univ, iff_true]
    norm_num
  -- Case t = -1: alternating signs make `1/(t^n - 1)` vanish at even n but
  -- equal -1/2 at odd n. The set of odd `n ∈ ℕ+` is infinite, which is enough
  -- to invoke `key` on the LHS. RHS magnitude is τ(n) ≥ 1 everywhere.
  by_cases htneg1 : t = -1
  · subst htneg1
    -- Construct the infinite set of odd positive naturals via the injection
    -- `k ↦ 2k + 1`, which lands in `ℕ+` and is always odd.
    have hinf_odd : Set.Infinite {n : ℕ+ | Odd (n : ℕ)} := by
      apply Set.infinite_of_injective_forall_mem
        (f := fun k : ℕ => (⟨2 * k + 1, Nat.succ_pos _⟩ : ℕ+))
      · intro a b hab; rw [Subtype.mk.injEq] at hab; omega
      · intro k; show Odd (2 * k + 1); exact ⟨k, rfl⟩
    have hL : ¬ Summable (fun n : ℕ+ => 1 / (((-1 : ℝ)) ^ (n : ℕ) - 1)) := by
      apply key _ (1/2) (by norm_num)
      apply hinf_odd.mono
      intro n hn
      -- For odd n: (-1)^n = -1, so 1/((-1)^n - 1) = 1/(-2), magnitude 1/2.
      show (1/2 : ℝ) ≤ |1 / ((-1 : ℝ) ^ (n : ℕ) - 1)|
      rw [Odd.neg_one_pow hn]; norm_num
    have hR : ¬ Summable (fun n : ℕ+ => ((n : ℕ).divisors.card : ℝ) / ((-1 : ℝ) ^ (n : ℕ))) := by
      apply key _ 1 (by norm_num)
      convert Set.infinite_univ (α := ℕ+)
      ext n
      simp only [Set.mem_ofPred_eq, Set.mem_univ, iff_true]
      -- |(-1)^n| = 1, so |τ(n) / (-1)^n| = τ(n) ≥ 1.
      rw [abs_div, abs_pow, abs_neg, abs_one, one_pow, div_one]
      rw [abs_of_nonneg (by positivity)]
      exact hcard_pos n
    rw [tsum_eq_zero_of_not_summable hL, tsum_eq_zero_of_not_summable hR]
  -- Remaining case: |t| ≤ 1 with t ∉ {1, 0, -1}, equivalently |t| < 1 and t ≠ 0.
  · -- First narrow `|t| ≤ 1` to `|t| < 1` using the case exclusions.
    have habs_lt : |t| < 1 := by
      rcases lt_or_eq_of_le ht with h | h
      · exact h
      · exfalso
        rcases (abs_eq zero_le_one).mp h with rfl | rfl
        · exact ht1 rfl
        · exact htneg1 rfl
    have habs_pos : 0 < |t| := abs_pos.mpr ht0
    -- Since `|t| < 1`, `|t^n| ≤ 1` for all `n ∈ ℕ+`.
    have hbound : ∀ (n : ℕ+), |t ^ (n : ℕ)| ≤ 1 := by
      intro n; rw [abs_pow]; exact pow_le_one₀ (abs_nonneg _) (le_of_lt habs_lt)
    -- Since `|t| < 1` strictly, `t^n ≠ 1` (else `|t|^n = 1` but `|t|^n ≤ |t| < 1`).
    have htn_ne_one : ∀ (n : ℕ+), t ^ (n : ℕ) ≠ 1 := by
      intro n hn
      have h1 : |t ^ (n : ℕ)| = 1 := by rw [hn]; exact abs_one
      rw [abs_pow] at h1
      have hle : |t| ^ (n : ℕ) ≤ |t| := by
        exact pow_le_of_le_one (abs_nonneg _) (le_of_lt habs_lt) n.pos.ne'
      linarith
    have htn_ne_zero : ∀ (n : ℕ+), t ^ (n : ℕ) ≠ 0 := fun n => pow_ne_zero _ ht0
    -- LHS: `|t^n - 1| ≤ |t^n| + 1 ≤ 2`, so `|1 / (t^n - 1)| ≥ 1/2` everywhere.
    have hL : ¬ Summable (fun n : ℕ+ => 1 / (t ^ (n : ℕ) - 1)) := by
      apply key _ (1/2) (by norm_num)
      convert Set.infinite_univ (α := ℕ+)
      ext n
      simp only [Set.mem_ofPred_eq, Set.mem_univ, iff_true]
      have hden_bound : |t ^ (n : ℕ) - 1| ≤ 2 := by
        calc |t ^ (n : ℕ) - 1| ≤ |t ^ (n : ℕ)| + |(1 : ℝ)| := abs_sub _ _
          _ ≤ 1 + 1 := by have := hbound n; rw [abs_one]; linarith
          _ = 2 := by norm_num
      have hden_pos : 0 < |t ^ (n : ℕ) - 1| := by
        rw [abs_pos, sub_ne_zero]; exact htn_ne_one n
      rw [abs_div, abs_one, le_div_iff₀ hden_pos]; linarith
    -- RHS: `|τ(n) / t^n| = τ(n) / |t^n| ≥ τ(n) ≥ 1` since `|t^n| ≤ 1`.
    have hR : ¬ Summable (fun n : ℕ+ => ((n : ℕ).divisors.card : ℝ) / (t ^ (n : ℕ))) := by
      apply key _ 1 (by norm_num)
      convert Set.infinite_univ (α := ℕ+)
      ext n
      simp only [Set.mem_ofPred_eq, Set.mem_univ, iff_true]
      rw [abs_div, le_div_iff₀ (abs_pos.mpr (htn_ne_zero n))]
      rw [abs_of_nonneg (by positivity : (0:ℝ) ≤ ((n : ℕ).divisors.card : ℝ))]
      have := hbound n
      have := hcard_pos n
      nlinarith
    rw [tsum_eq_zero_of_not_summable hL, tsum_eq_zero_of_not_summable hR]

theorem lambert_series_eq_num_divisor_sum : ∀ t : ℚ,
     ∑' n : ℕ+, 1 / ((t : ℝ) ^ (n : ℕ) - 1) =
     ∑' n : ℕ+, (n : ℕ).divisors.card / ((t : ℝ) ^ (n : ℕ)) := by
  intro t
  obtain ht | ht := lt_or_ge 1 |(t : ℝ)|
  · exact lambert_convergent (t : ℝ) ht
  · exact lambert_divergent (t : ℝ) ht

end Erdos1049
