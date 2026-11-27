import Mathlib

open Finset Filter Metric Real

open scoped EuclideanGeometry

namespace Erdos1084

variable {n : ℕ}

noncomputable def f (d n : ℕ) : ℕ :=
  ⨆ (s : Finset (ℝ^ d)) (_ : s.card = n) (_ : IsSeparated' 1 (s : Set (ℝ^ d))), unitDistNum s

-- TODO: Add erdos_1084.

theorem erdos_1084.variants.upper_lower_d3 :
    ∃ c₁ : ℝ, ∃ c₂ > (0 : ℝ), ∀ᶠ n in atTop, 6 * n - c₁ * n ^ (2 / 3 : ℝ) ≤ f 3 n ∧ f 3 n ≤ 6 * n - c₂ * n ^ (2 / 3 : ℝ) := by
  sorry

end Erdos1084
