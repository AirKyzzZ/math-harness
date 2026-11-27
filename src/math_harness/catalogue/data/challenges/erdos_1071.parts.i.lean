import Mathlib

open Set Metric EuclideanGeometry Order

namespace Erdos1071

def SegmentsDisjoint (seg1 seg2 : ℝ² × ℝ²) : Prop :=
  segment ℝ seg1.1 seg1.2 ∩ segment ℝ seg2.1 seg2.2 ⊆ {seg1.1, seg1.2, seg2.1, seg2.2}

theorem erdos_1071.parts.i :
    ∃ S : Finset (ℝ² × ℝ²), Maximal (fun T : Finset (ℝ² × ℝ²) => (∀ seg ∈ T, dist seg.1 seg.2 = 1 ∧ seg.1 0 ∈ Icc 0 1 ∧ seg.1 1 ∈ Icc 0 1 ∧ seg.2 0 ∈ Icc 0 1 ∧ seg.2 1 ∈ Icc 0 1) ∧ (T : Set (ℝ² × ℝ²)).Pairwise SegmentsDisjoint) S := by
  sorry

end Erdos1071
