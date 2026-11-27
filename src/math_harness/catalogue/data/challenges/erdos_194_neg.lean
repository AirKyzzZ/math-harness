import Mathlib

namespace Erdos194

theorem erdos_194_neg :
    ¬ (¬ ∀ k ≥ 3, ∀ r : ℝ → ℝ → Prop, IsStrictTotalOrder ℝ r → ∃ s : List ℝ, s.IsAPOfLength k ∧ (s.Pairwise r ∨ s.Pairwise (flip r))) := by
  sorry

end Erdos194
