import Mathlib

namespace Erdos1105

open SimpleGraph Asymptotics Filter

theorem erdos_1105.parts.ii_neg :
    ¬ (∀ (k n : ℕ), 5 ≤ k → k ≤ n → let ℓ := (k - 1) / 2 let ε := if Odd k then 1 else 2 antiRamseyNum (pathGraph k) n = max ((k - 2).choose 2 + 1) ((ℓ - 1).choose 2 + (ℓ - 1) * (n - ℓ + 1) + ε)) := by
  sorry

-- TODO: Add Erdős, Simonovits, and Sós variant.

-- TODO: Add Simonovits and Sós variant.

end Erdos1105
