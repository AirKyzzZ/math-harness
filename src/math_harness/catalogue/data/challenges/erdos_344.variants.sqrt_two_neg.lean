import Mathlib

open Filter

namespace Erdos344

theorem erdos_344.variants.sqrt_two_neg :
    ¬ (∀ A : Set ℕ, (∀ᶠ N : ℕ in atTop, Real.sqrt (2 * N) ≤ A.countUpTo N) → IsSubcomplete A) := by
  sorry

theorem erdos_344.variants.folkman :
    ∀ ε : ℝ, 0 < ε → ∀ c : ℝ, 0 < c → ∀ A : Set ℕ,
      (∀ᶠ N : ℕ in atTop, c * (N : ℝ) ^ ((1 : ℝ) / 2 + ε) ≤ A.countUpTo N) →
      IsSubcomplete A := by
  obtain ⟨C, _, h⟩ := erdos_344
  intro ε hε c hc A hA
  refine h A ?_
  have hpow : Tendsto (fun N : ℕ ↦ (N : ℝ) ^ ε) atTop atTop :=
    (tendsto_rpow_atTop hε).comp tendsto_natCast_atTop_atTop
  filter_upwards [hA, hpow.eventually_ge_atTop (C / c)] with N hN hNe
  have hsplit : (N : ℝ) ^ ((1 : ℝ) / 2 + ε) = Real.sqrt N * (N : ℝ) ^ ε := by
    rw [Real.rpow_add' (Nat.cast_nonneg N) (by positivity), Real.sqrt_eq_rpow]
  calc C * Real.sqrt N = c * (C / c) * Real.sqrt N := by field_simp
    _ ≤ c * (N : ℝ) ^ ε * Real.sqrt N := by gcongr
    _ = c * (N : ℝ) ^ ((1 : ℝ) / 2 + ε) := by rw [hsplit]; ring
    _ ≤ A.countUpTo N := hN

theorem univ_density (C : ℝ) :
    ∀ᶠ N : ℕ in atTop, C * Real.sqrt N ≤ (Set.univ : Set ℕ).countUpTo N := by
  have hlim : Tendsto (fun N : ℕ ↦ Real.sqrt N) atTop atTop :=
    Real.tendsto_sqrt_atTop.comp tendsto_natCast_atTop_atTop
  filter_upwards [hlim.eventually_ge_atTop C] with N hN
  have hc : (Set.univ : Set ℕ).countUpTo N = N := by simp [Set.countUpTo]
  rw [hc]
  calc C * Real.sqrt N ≤ Real.sqrt N * Real.sqrt N := by gcongr
    _ = N := Real.mul_self_sqrt (Nat.cast_nonneg N)

end Erdos344
