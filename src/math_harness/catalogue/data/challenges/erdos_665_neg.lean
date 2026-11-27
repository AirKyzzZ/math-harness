import Mathlib

namespace Erdos665

open Filter Asymptotics

theorem erdos_665_neg :
    ¬ (∃ C : ℝ, 0 < C ∧ ∀ᶠ n : ℕ in atTop, ∃ H : Finset (Finset (Fin n)), H.IsPairwiseBalancedDesign ∧ ∀ e ∈ H, e.card < n ∧ Real.sqrt n - C < e.card) := by
  sorry

end Erdos665
