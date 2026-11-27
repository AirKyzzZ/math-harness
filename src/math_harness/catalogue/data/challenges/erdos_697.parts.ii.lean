import Mathlib

open Filter Set Real

open scoped Topology

namespace Erdos697

noncomputable def δ (m : ℕ) (α : ℝ) : ℝ := (density_exists m α).choose

theorem erdos_697.parts.ii {α : ℝ} (hα : 1 / log (2 : ℝ) < α) :
    Tendsto (δ · α) atTop (𝓝 1) := by
  sorry

end Erdos697
