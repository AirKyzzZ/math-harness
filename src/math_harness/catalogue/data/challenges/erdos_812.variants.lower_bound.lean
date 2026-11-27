import Mathlib

open Combinatorics Filter

open scoped Topology

namespace Erdos812

local notation "R" => hypergraphRamsey 2

theorem erdos_812.variants.lower_bound :
    ∀ n : ℕ, n ≥ 2 → (R (n + 1) : ℤ) - (R n : ℤ) ≥ 4 * (n : ℤ) - 8 := by
  sorry

--  TODO: Add Erdos Problem 165 implication when Erdos Problem 165 is formalized.

end Erdos812
