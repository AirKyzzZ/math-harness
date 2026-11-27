import Mathlib

open Filter Set Real

open scoped Topology

namespace Erdos697

noncomputable def δ (m : ℕ) (α : ℝ) : ℝ := (density_exists m α).choose

theorem erdos_697.parts.i {α : ℝ} (hα : α < 1 / log (2 : ℝ)) :
    Tendsto (δ · α) atTop (𝓝 0) := by
  sorry

end Erdos697
