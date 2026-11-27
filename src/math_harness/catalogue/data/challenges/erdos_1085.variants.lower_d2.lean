import Mathlib

open Filter Real

open scoped EuclideanGeometry Topology

namespace Erdos1085

variable {d : ℕ}

noncomputable def f (d n : ℕ) : ℕ := ⨆ (s : Finset (ℝ^ d)) (_ : s.card = n), unitDistNum s

-- TODO: Add erdos_1085.

theorem erdos_1085.variants.lower_d2 :
    ∃ c > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (n : ℝ) ^ (1 + c / log (log n)) < f 2 n := by
  sorry

end Erdos1085
