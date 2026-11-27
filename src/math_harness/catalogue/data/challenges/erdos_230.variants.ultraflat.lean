import Mathlib

open Filter Topology

namespace Erdos230

noncomputable def circleMax {n : ℕ} (a : Fin n → ℂ) : ℝ :=
  ⨆ z : Metric.sphere (0 : ℂ) 1, ‖∑ k : Fin n, a k * (z : ℂ) ^ ((k : ℕ) + 1)‖

theorem erdos_230.variants.ultraflat :
    ∃ a : (n : ℕ) → Fin n → ℂ, (∀ n k, ‖a n k‖ = 1) ∧ Tendsto (fun n : ℕ => ⨆ z : Metric.sphere (0 : ℂ) 1, |‖∑ k : Fin n, a n k * (z : ℂ) ^ ((k : ℕ) + 1)‖ / √n - 1|) atTop (𝓝 0) := by
  sorry

end Erdos230
