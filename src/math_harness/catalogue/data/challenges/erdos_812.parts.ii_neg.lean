import Mathlib

open Combinatorics Filter

open scoped Topology

namespace Erdos812

local notation "R" => hypergraphRamsey 2

theorem erdos_812.parts.ii_neg :
    ¬ ((fun n : ℕ ↦ (R (n + 1) : ℝ) - (R n : ℝ)) ≫ (fun n : ℕ ↦ (n : ℝ) ^ 2)) := by
  sorry

--  TODO: Add Erdos Problem 165 implication when Erdos Problem 165 is formalized.

end Erdos812
