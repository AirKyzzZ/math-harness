import Mathlib

namespace Erdos965

theorem erdos_965_neg :
    ¬ (¬ ∀ f : ℝ → Fin 2, ∃ A : Set ℝ, ¬ A.Countable ∧ ∀ᵉ (a ∈ A) (b ∈ A) (c ∈ A) (d ∈ A), a ≠ b → c ≠ d → f (a + b) = f (c + d)) := by
  sorry

end Erdos965
