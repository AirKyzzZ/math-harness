import Mathlib

open Filter

open scoped Topology

namespace Erdos1014

local notation "R(" k ", " l ")" => SimpleGraph.classicalRamsey k l

theorem erdos_1014 :
    ∀ k : ℕ, 3 ≤ k → Tendsto (fun l : ℕ ↦ (R(k, l + 1) : ℝ) / (R(k, l) : ℝ)) atTop (𝓝 1) := by
  sorry

end Erdos1014
