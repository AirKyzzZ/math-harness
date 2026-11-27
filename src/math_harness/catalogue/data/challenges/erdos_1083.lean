import Mathlib

open Filter

open scoped EuclideanGeometry

namespace Erdos1083

theorem erdos_1083 :
    ∀ d : ℕ, 3 ≤ d → ∃ o : ℕ → ℝ, o =o[atTop] (1 : ℕ → ℝ) ∧ ∀ᶠ n : ℕ in atTop, (minimalDistinctDistances (ℝ^d) n : ℝ) = (n : ℝ) ^ ((2 : ℝ) / (d : ℝ) - o n) := by
  sorry

end Erdos1083
