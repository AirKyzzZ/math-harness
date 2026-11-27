import Mathlib

open Filter Real

namespace Erdos748

open scoped Classical in
noncomputable def f (n : ℕ) : ℕ :=
  ((Finset.Icc 1 n).powerset.filter fun A : Finset ℕ ↦ IsSumFree (A : Set ℕ)).card

theorem erdos_748_neg :
    ¬ (Tendsto (fun n : ℕ ↦ logb 2 (f n) / n) atTop (nhds (1 / 2))) := by
  sorry

theorem erdos_748.variants.lower_bound (n : ℕ) :
    (2 : ℝ) ^ ((n : ℝ) / 2) ≤ (f n : ℝ) := by
  classical
  -- Every subset of `(n/2, n]` is sum-free, and there are `2 ^ (n - n / 2)` of them.
  have hsub : (Finset.Ioc (n / 2) n).powerset ⊆
      (Finset.Icc 1 n).powerset.filter fun A : Finset ℕ ↦ IsSumFree (A : Set ℕ) := by
    intro A hA
    rw [Finset.mem_powerset] at hA
    refine Finset.mem_filter.mpr ⟨Finset.mem_powerset.mpr fun a ha => ?_, ?_⟩
    · have := Finset.mem_Ioc.mp (hA ha)
      exact Finset.mem_Icc.mpr ⟨by omega, this.2⟩
    · rw [isSumFree_iff]
      intro x hx y hy hxy
      have h1 := Finset.mem_Ioc.mp (hA (Finset.mem_coe.mp hx))
      have h2 := Finset.mem_Ioc.mp (hA (Finset.mem_coe.mp hy))
      have h3 := Finset.mem_Ioc.mp (hA (Finset.mem_coe.mp hxy))
      omega
  have hcard : 2 ^ (n - n / 2) ≤ f n := by
    have h := Finset.card_le_card hsub
    rw [Finset.card_powerset, Nat.card_Ioc] at h
    unfold f
    convert h
  have hexp : (n : ℝ) / 2 ≤ ((n - n / 2 : ℕ) : ℝ) := by
    have h : n ≤ 2 * (n - n / 2) := by omega
    have h' : (n : ℝ) ≤ 2 * ((n - n / 2 : ℕ) : ℝ) := by exact_mod_cast h
    linarith
  calc (2 : ℝ) ^ ((n : ℝ) / 2) ≤ (2 : ℝ) ^ ((n - n / 2 : ℕ) : ℝ) :=
        Real.rpow_le_rpow_of_exponent_le (by norm_num) hexp
    _ = ((2 ^ (n - n / 2) : ℕ) : ℝ) := by rw [Real.rpow_natCast]; norm_cast
    _ ≤ (f n : ℝ) := by exact_mod_cast hcard

end Erdos748
