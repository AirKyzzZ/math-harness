import Mathlib

namespace Erdos68

theorem erdos_68 :
    Irrational (∑' n : ℕ, 1 / ((n + 2).factorial - 1 : ℝ)) := by
  sorry

theorem sum_factorial_inv_eq_geometric :
    let f (n k : ℕ) : ℝ := 1 / ((n + 2).factorial : ℝ) ^ (k + 1)
    ∑' n : ℕ, (1 : ℝ) / ((n + 2).factorial - 1) = ∑' n : ℕ, ∑' k : ℕ, f n k := by
  intro f
  apply tsum_congr
  intro n
  symm
  -- The inner sum is a geometric series with ratio r = ((n + 2)!)⁻¹.
  set r : ℝ := ((n + 2).factorial : ℝ)⁻¹ with hr_def
  have hr_nonneg : 0 ≤ r := by positivity
  have hr_lt_one : r < 1 := inv_lt_one_of_one_lt₀ (by simp)
  -- Geometric series: HasSum (fun k ↦ r ^ k) ((1 - r)⁻¹)
  have hgeom := hasSum_geometric_of_lt_one hr_nonneg hr_lt_one
  -- Multiply by r to shift the index: HasSum (fun k ↦ r * r ^ k) (r * (1 - r)⁻¹)
  have hshift := hgeom.mul_left r
  -- Each summand satisfies f n k = r * r ^ k.
  have hf_eq : ∀ k, f n k = r * r ^ k := fun k => by simp only [f, hr_def]; ring
  -- Evaluate ∑' k, f n k = r * (1 - r)⁻¹ = 1 / ((n + 2)! - 1).
  exact ((hshift.congr_fun hf_eq).tsum_eq.trans (by simp only [hr_def]; field_simp))

end Erdos68
