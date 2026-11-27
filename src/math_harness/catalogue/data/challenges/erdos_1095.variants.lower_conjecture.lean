import Mathlib

open Nat hiding log

open Real Filter

open scoped Asymptotics Topology

namespace Erdos1095

noncomputable def g (k : ℕ) : ℕ := sInf {m | k + 1 < m ∧ k < (m.choose k).minFac}

-- TODO: Add erdos_1095.

theorem erdos_1095.variants.lower_conjecture :
    ∃ c > 0, ∀ᶠ k in atTop, g k ≥ exp (c * k / log k) := by
  sorry

end Erdos1095
