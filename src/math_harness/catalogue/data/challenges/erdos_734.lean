import Mathlib

namespace Erdos734

open Filter Asymptotics

theorem erdos_734 :
    ∃ C : ℝ, 0 < C ∧ ∀ᶠ n : ℕ in atTop, ∃ H : Finset (Finset (Fin n)), H.IsPairwiseBalancedDesign ∧ (∀ e ∈ H, e.card < n) ∧ ∀ t : ℕ, ({e ∈ H | e.card = t}.card : ℝ) ≤ C * Real.sqrt n := by
  sorry

end Erdos734
