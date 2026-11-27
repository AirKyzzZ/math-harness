import Mathlib

open Filter EuclideanGeometry NumberField

open scoped EuclideanGeometry

namespace Erdos90

open Finset

noncomputable def unitDistanceCounts (n : ℕ) : Set ℕ :=
  {unitDistNum points | (points : Finset ℝ²) (_ : points.card = n)}

theorem unitDistanceCounts_BddAbove (n : ℕ) : BddAbove <| unitDistanceCounts n := by
  use n.choose 2
  rintro _ ⟨points, rfl, rfl⟩
  exact unitDistNum_le_choose_two points

noncomputable def maxUnitDistances (n : ℕ) : ℕ :=
  sSup (unitDistanceCounts n)

theorem erdos_90.variants.sawin_explicit :
    {n : ℕ | (n : ℝ) ^ (1.014114 : ℝ) ≤ (maxUnitDistances n : ℝ)}.Infinite := by
  sorry

theorem erdos_90.variants.sawin_explicit_implies_polynomial_lower_bound :
    type_of% erdos_90.variants.sawin_explicit →
    type_of% erdos_90.variants.polynomial_lower_bound := by
  intro h
  exact ⟨0.014114, by norm_num, by convert h; norm_num⟩

theorem erdos_90.variants.polynomial_lower_bound_implies_erdos_90 :
    type_of% erdos_90.variants.polynomial_lower_bound →
    type_of% erdos_90 := by
  rintro ⟨c, hc, hInf⟩ ⟨O_fn, hO_bigO, hO_eq⟩
  -- 1/log(log(n)) → 0, so O_fn = O(1/log log n) implies O_fn → 0
  have hg : Tendsto (fun n : ℕ => (1 : ℝ) / (↑n : ℝ).log.log) atTop (nhds 0) := by
    simp_rw [one_div]
    exact tendsto_inv_atTop_zero.comp
      (Real.tendsto_log_atTop.comp (Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop))
  have hO_zero : Tendsto O_fn atTop (nhds 0) :=
    (Asymptotics.isLittleO_one_iff ℝ).mp
      (hO_bigO.trans_isLittleO ((Asymptotics.isLittleO_one_iff ℝ).mpr hg))
  -- Eventually u(n) < n^{1+c}, contradicting the infinitely-often lower bound
  have hLt : ∀ᶠ (n : ℕ) in atTop, ¬((n : ℝ) ^ (1 + c) ≤ (maxUnitDistances n : ℝ)) := by
    filter_upwards [hO_eq, hO_zero.eventually (Iio_mem_nhds hc), eventually_ge_atTop 2]
      with n hEq hOLt hn
    rw [not_le, hEq]
    exact Real.rpow_lt_rpow_of_exponent_lt (by exact_mod_cast (by omega : 1 < n)) (by linarith)
  rw [← cofinite_eq_atTop] at hLt
  exact hInf.frequently_cofinite hLt

end Erdos90
