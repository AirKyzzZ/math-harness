import Mathlib

namespace Erdos464

theorem erdos_464 :
    ∀ n : ℕ → ℕ, StrictMono n → (∀ k, 0 < n k) → IsLacunary n → ∃ θ : ℝ, Irrational θ ∧ ¬ Dense (Set.range fun k => (↑(θ * n k) : AddCircle (1 : ℝ))) := by
  sorry

end Erdos464
