import Mathlib

open AdditiveCombinatorics Nat Filter

namespace Erdos943

theorem erdos_943_neg :
    ¬ (∃ (o : ℕ → ℝ), o =o[atTop] (1 : ℕ → ℝ) ∧ ∀ᶠ n in atTop, (sumRep Powerful n) ≤ (n : ℝ)^(o n)) := by
  sorry

end Erdos943
