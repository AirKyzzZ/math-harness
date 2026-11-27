import Mathlib

open Combinatorics Filter

open scoped Topology

namespace Erdos812

local notation "R" => hypergraphRamsey 2

theorem erdos_812.parts.i_neg :
    ¬ (∃ c > 0, ∀ᶠ n in atTop, (R (n + 1) : ℝ) / (R n : ℝ) ≥ 1 + c) := by
  sorry

--  TODO: Add Erdos Problem 165 implication when Erdos Problem 165 is formalized.

end Erdos812
