import Mathlib

open scoped Nat Real

open Filter Polynomial

namespace Erdos513

noncomputable def ratio (r : ℝ) (f : ℂ → ℂ) : ℝ :=
  (⨆ n, ‖iteratedDeriv n f 0 * (n ! : ℝ)⁻¹ * r ^ n‖) / (⨆ z : {z : ℂ // ‖z‖ = r}, ‖f z‖)

noncomputable def maxTermConstant : ℝ :=
  ⨆ f : {f : ℂ → ℂ // Transcendental ℂ[X] f ∧ Differentiable ℂ f},
    liminf (fun r : ℝ => ratio r f) atTop

theorem erdos_513.variants.lower_bound :
    maxTermConstant > 1 / 2 := by
  sorry

end Erdos513
