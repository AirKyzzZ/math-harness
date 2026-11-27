import Mathlib

open Filter Topology

namespace Erdos230

noncomputable def circleMax {n : ℕ} (a : Fin n → ℂ) : ℝ :=
  ⨆ z : Metric.sphere (0 : ℂ) 1, ‖∑ k : Fin n, a k * (z : ℂ) ^ ((k : ℕ) + 1)‖

theorem erdos_230_neg :
    ¬ (¬ ∃ c : ℝ, 0 < c ∧ ∀ n : ℕ, 2 ≤ n → ∀ a : Fin n → ℂ, (∀ k, ‖a k‖ = 1) → (1 + c) * √n ≤ circleMax a) := by
  sorry

end Erdos230
