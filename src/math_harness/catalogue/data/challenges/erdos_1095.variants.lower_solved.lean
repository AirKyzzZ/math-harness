import Mathlib

open Nat hiding log

open Real Filter

open scoped Asymptotics Topology

namespace Erdos1095

noncomputable def g (k : ℕ) : ℕ := sInf {m | k + 1 < m ∧ k < (m.choose k).minFac}

-- TODO: Add erdos_1095.

theorem erdos_1095.variants.lower_solved :
    ∃ c > 0, (fun k : ℕ ↦ exp (c * log k ^ 2)) =O[atTop] fun k ↦ (g k : ℝ) := by
  sorry

end Erdos1095
