import Mathlib

open Set Metric EuclideanGeometry Order

namespace Erdos1071

def SegmentsDisjoint (seg1 seg2 : ℝ² × ℝ²) : Prop :=
  segment ℝ seg1.1 seg1.2 ∩ segment ℝ seg2.1 seg2.2 ⊆ {seg1.1, seg1.2, seg2.1, seg2.2}

theorem erdos_1071.parts.ii_neg :
    ¬ (∃ (R : Set ℝ²) (S : Set (ℝ² × ℝ²)), IsOpen R ∧ IsConnected R ∧ S.Countable ∧ S.Infinite ∧ Maximal (fun T : Set (ℝ² × ℝ²) => (∀ seg ∈ T, dist seg.1 seg.2 = 1 ∧ openSegment ℝ seg.1 seg.2 ⊆ R) ∧ T.Pairwise SegmentsDisjoint) S) := by
  sorry

end Erdos1071
