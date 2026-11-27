import Mathlib

open Asymptotics Filter Finset

namespace Erdos678

lemma lcmInterval_lt_example1 : lcmInterval 104 8 < lcmInterval 96 7 := by decide

lemma lcmInterval_lt_example2 : lcmInterval 139 8 < lcmInterval 132 7 := by decide

lemma lcmInterval_lt_example3 : lcmInterval 62 8 < lcmInterval 52 7 := by decide

lemma lcmInterval_lt_example4 : lcmInterval 47 9 < lcmInterval 36 8 := by decide

theorem erdos_678 :
    ∀ᶠ k in atTop, {(m, n) | n + k ≤ m ∧ lcmInterval m (k + 1) < lcmInterval n k}.Nonempty := by
  sorry

end Erdos678
