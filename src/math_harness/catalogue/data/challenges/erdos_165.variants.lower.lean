import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos165

local notation "R(" k ", " l ")" => SimpleGraph.classicalRamsey k l

theorem erdos_165.variants.lower :
    ∀ ε > (0 : ℝ), ∀ᶠ k : ℕ in atTop, (1 / 2 - ε) * (k : ℝ) ^ 2 / Real.log k ≤ (R(3, k) : ℝ) := by
  sorry

end Erdos165
