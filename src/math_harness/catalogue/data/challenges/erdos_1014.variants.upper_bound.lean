import Mathlib

open Filter

open scoped Topology

namespace Erdos1014

local notation "R(" k ", " l ")" => SimpleGraph.classicalRamsey k l

theorem erdos_1014.variants.upper_bound :
    ∃ c : ℝ, 0 < c ∧ ∀ k : ℕ, 3 ≤ k → ∃ C : ℝ, ∀ᶠ l : ℕ in atTop, (R(k, l + 1) : ℝ) ≤ (1 + C * (l : ℝ) ^ (-c / (k : ℝ) ^ 2)) * (R(k, l) : ℝ) := by
  sorry

end Erdos1014
