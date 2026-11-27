import Mathlib

open Filter

open EuclideanGeometry

namespace Erdos89

theorem erdos_89.variants.grid_upper_bound :
    (fun n => (minimalDistinctDistances ℝ² n : ℝ)) =O[atTop] (fun (n : ℕ) => n/(n : ℝ).log.sqrt) := by
  sorry

theorem erdos_89.variants.implies_n_dvd_log_n (h : type_of% erdos_89) :
    type_of% erdos_89.variants.n_dvd_log_n := by
  refine .trans ?_ h
  have := (Asymptotics.isLittleO_one_left_iff ℝ).mpr <| tendsto_norm_atTop_atTop.comp <|
    (tendsto_rpow_atTop (show 0 < 1/2 by norm_num)).comp
    (Real.tendsto_log_atTop.comp tendsto_natCast_atTop_atTop)
  convert! (Asymptotics.isBigO_refl (fun n : ℕ ↦ n/(n : ℝ).log) _).mul this.isBigO using 1
  · simp
  · simp_rw [Function.comp, div_mul, ← Real.sqrt_eq_rpow, Real.div_sqrt]

-- TODO(firsching): formalize any remaining remarks from the erdosproblems.com page.

end Erdos89
