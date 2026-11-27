import Mathlib

open Finset Filter Metric Real

open scoped EuclideanGeometry

namespace Erdos1084

variable {n : ℕ}

noncomputable def f (d n : ℕ) : ℕ :=
  ⨆ (s : Finset (ℝ^ d)) (_ : s.card = n) (_ : IsSeparated' 1 (s : Set (ℝ^ d))), unitDistNum s

-- TODO: Add erdos_1084.

theorem erdos_1084.variants.upper_d2 :
    ∃ c > (0 : ℝ), ∀ n > 0, f 2 n < 3 * n - c * sqrt n := by
  sorry

end Erdos1084
