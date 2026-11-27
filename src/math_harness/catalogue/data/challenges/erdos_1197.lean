import Mathlib

open Filter MeasureTheory

open scoped Pointwise

namespace Erdos1197

theorem erdos_1197 :
    ¬ ∀ E : Set ℝ, MeasurableSet E → E ⊆ Set.Ioi 0 → 0 < volume E → ∀ᵐ x ∂(volume.restrict (Set.Ioi (0 : ℝ))), ∀ᶠ n : ℕ in atTop, ∃ r : ℕ, 1 ≤ r ∧ (n : ℝ) * x ∈ (r : ℝ) • E := by
  sorry

end Erdos1197
