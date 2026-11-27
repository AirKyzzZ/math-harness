import Mathlib

open Filter Set Real

open scoped Topology

namespace Erdos697

noncomputable def δ (m : ℕ) (α : ℝ) : ℝ := (density_exists m α).choose

theorem erdos_697.variants.delta_lt (m : ℕ) (α : ℝ) (hm : 0 < m) :
    δ m α < (m ^ α + 1) / m := by
  sorry

end Erdos697
