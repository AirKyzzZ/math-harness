import Mathlib

open Finset Filter Metric Real

open scoped EuclideanGeometry

namespace Erdos1084

variable {n : ℕ}

noncomputable def f (d n : ℕ) : ℕ :=
  ⨆ (s : Finset (ℝ^ d)) (_ : s.card = n) (_ : IsSeparated' 1 (s : Set (ℝ^ d))), unitDistNum s

-- TODO: Add erdos_1084.

theorem erdos_1084.variants.upper_d1 :
    f 1 n = n - 1 := by
  sorry

end Erdos1084
