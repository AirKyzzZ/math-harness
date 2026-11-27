import Mathlib

namespace Erdos498

theorem erdos_498_neg :
    ¬ (∀ (n : ℕ) (z : Fin n → ℂ), (∀ i, 1 ≤ ‖z i‖) → ∀ c : ℂ, {ε : Fin n → ℤ | (∀ i, ε i = -1 ∨ ε i = 1) ∧ (∑ i, (ε i : ℂ) * z i) ∈ Metric.ball c 1}.ncard ≤ n.choose (n / 2)) := by
  sorry

end Erdos498
