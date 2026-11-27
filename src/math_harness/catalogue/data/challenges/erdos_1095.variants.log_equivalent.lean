import Mathlib

open Nat hiding log

open Real Filter

open scoped Asymptotics Topology

namespace Erdos1095

noncomputable def g (k : ℕ) : ℕ := sInf {m | k + 1 < m ∧ k < (m.choose k).minFac}

-- TODO: Add erdos_1095.

theorem erdos_1095.variants.log_equivalent :
    (fun k ↦ log (g k)) =Θ[atTop] (fun k ↦ (k : ℝ) / log k) := by
  sorry

end Erdos1095
