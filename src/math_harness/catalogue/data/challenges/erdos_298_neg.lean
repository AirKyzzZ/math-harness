import Mathlib

namespace Erdos298

theorem erdos_298_neg :
    ¬ ((∀ (A : Set ℕ), 0 ∉ A → 0 < A.upperDensity → ∃ (S : Finset ℕ), ↑S ⊆ A ∧ ∑ n ∈ S, (1 / n : ℚ) = 1)) := by
  sorry

end Erdos298
