import Mathlib

namespace Erdos1105

open SimpleGraph Asymptotics Filter

theorem erdos_1105.parts.i :
    ∀ k, 3 ≤ k → ((fun n => (antiRamseyNum (cycleGraph k) n : ℝ) - ((k - 2 : ℝ) / 2 + 1 / (k - 1)) * n) =O[atTop] (fun _ => (1 : ℝ))) := by
  sorry

-- TODO: Add Erdős, Simonovits, and Sós variant.

-- TODO: Add Simonovits and Sós variant.

end Erdos1105
