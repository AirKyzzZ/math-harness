import Mathlib

open Filter Real

open scoped EuclideanGeometry Topology

namespace Erdos1085

variable {d : ℕ}

noncomputable def f (d n : ℕ) : ℕ := ⨆ (s : Finset (ℝ^ d)) (_ : s.card = n), unitDistNum s

-- TODO: Add erdos_1085.

theorem erdos_1085.variants.upper_d4_erdos (hd : 4 ≤ d) :
    ∃ g : ℕ → ℝ, Tendsto g atTop (𝓝 0) ∧ ∀ n, f d n ≤ (↑(d / 2 - 1) / (2 * ↑(d / 2)) + g n) * n ^ 2 := by
  sorry

end Erdos1085
