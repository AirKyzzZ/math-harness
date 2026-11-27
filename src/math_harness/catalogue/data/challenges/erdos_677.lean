import Mathlib

namespace Erdos677

open Finset

lemma lcmInterval_eq_example1 : lcmInterval 4 3 = lcmInterval 13 2 ∧
                                lcmInterval 3 4 = lcmInterval 19 2 := by decide

theorem erdos_677 :
    ∀ (m n k : ℕ), k > 0 → m ≥ n + k → lcmInterval m k ≠ lcmInterval n k := by
  sorry

-- TODO: Add the other statements from the reference.
