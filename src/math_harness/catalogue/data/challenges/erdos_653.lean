import Mathlib

open Finset EuclideanGeometry Filter

namespace Erdos653

theorem erdos_653 :
    ∃ o : ℕ → ℝ, o =o[atTop] (1 : ℕ → ℝ) ∧ ∀ᶠ n in atTop, (1 - o n) * n ≤ maximalDistinctDistancesFrom n := by
  sorry

end Erdos653
