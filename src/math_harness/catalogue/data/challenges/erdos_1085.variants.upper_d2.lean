import Mathlib

open Filter Real

open scoped EuclideanGeometry Topology

namespace Erdos1085

variable {d : ℕ}

noncomputable def f (d n : ℕ) : ℕ := ⨆ (s : Finset (ℝ^ d)) (_ : s.card = n), unitDistNum s

-- TODO: Add erdos_1085.

theorem erdos_1085.variants.upper_d2 :
    (fun n ↦ (f 2 n : ℝ)) =O[atTop] (fun n ↦ (n : ℝ) ^ (4/3 : ℝ)) := by
  sorry

end Erdos1085
