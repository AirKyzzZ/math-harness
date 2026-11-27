import Mathlib

open Filter

namespace Erdos115

theorem erdos_115 :
    ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, ∀ p : Polynomial ℂ, p.Monic → p.natDegree = n → IsConnected {z : ℂ | ‖p.eval z‖ ≤ 1} → ∀ z : ℂ, ‖p.eval z‖ ≤ 1 → ‖p.derivative.eval z‖ ≤ (1 / 2 + ε) * (n : ℝ) ^ 2 := by
  sorry

end Erdos115
