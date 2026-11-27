import Mathlib

open Filter

open scoped Asymptotics

namespace Erdos165

local notation "R(" k ", " l ")" => SimpleGraph.classicalRamsey k l

theorem erdos_165.variants.conjecture :
    (fun k : ℕ ↦ (R(3, k) : ℝ)) ~[atTop] (fun k : ℕ ↦ (k : ℝ) ^ 2 / (2 * Real.log k)) := by
  sorry

end Erdos165
