import Mathlib

open Filter

namespace Erdos299

theorem erdos_299.variants.density :
    ∀ (A : Set ℕ), 0 ∉ A → 0 < A.upperDensity → ∃ S : Finset ℕ, ↑S ⊆ A ∧ ∑ n ∈ S, (1 : ℝ) / n = 1 := by
  sorry

end Erdos299
