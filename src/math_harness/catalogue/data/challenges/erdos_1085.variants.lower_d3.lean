import Mathlib

open Filter Real

open scoped EuclideanGeometry Topology

namespace Erdos1085

variable {d : ℕ}

noncomputable def f (d n : ℕ) : ℕ := ⨆ (s : Finset (ℝ^ d)) (_ : s.card = n), unitDistNum s

-- TODO: Add erdos_1085.

theorem erdos_1085.variants.lower_d3 :
    (fun n : ℕ ↦ (n : ℝ) ^ (4/3 : ℝ) * log (log n)) =O[atTop] (fun n ↦ (f 3 n : ℝ)) := by
  sorry

end Erdos1085
