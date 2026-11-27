import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos165

local notation "R(" k ", " l ")" => SimpleGraph.classicalRamsey k l

theorem erdos_165.variants.upper :
    ∀ ε > (0 : ℝ), ∀ᶠ k : ℕ in atTop, (R(3, k) : ℝ) ≤ (1 + ε) * (k : ℝ) ^ 2 / Real.log k := by
  sorry

end Erdos165
