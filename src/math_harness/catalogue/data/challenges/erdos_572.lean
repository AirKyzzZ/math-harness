import Mathlib

open Filter

namespace Erdos572

theorem erdos_572 (k : ℕ) (hk : 3 ≤ k) :
    ∃ c > (0 : ℝ), ∀ᶠ (n : ℕ) in atTop, c * (n : ℝ) ^ (1 + 1 / (k : ℝ)) ≤ (SimpleGraph.extremalNumber n (SimpleGraph.cycleGraph (2 * k)) : ℝ) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos572
