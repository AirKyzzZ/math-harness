import Mathlib

open Affine EuclideanGeometry

namespace Erdos898

theorem erdos_898 (A B C P L M N : ℝ²) (hABC : AffineIndependent ℝ ![A, B, C]) (hP : P ∈ interior (convexHull ℝ ({A, B, C} : Set ℝ²))) (hN : N ∈ line[ℝ, A, B]) (hPN : line[ℝ, P, N].direction ⟂ line[ℝ, A, B].direction) (hM : M ∈ line[ℝ, B, C]) (hPM : line[ℝ, P, M].direction ⟂ line[ℝ, B, C].direction) (hL : L ∈ line[ℝ, C, A]) (hPL : line[ℝ, P, L].direction ⟂ line[ℝ, C, A].direction) :
    dist P A + dist P B + dist P C ≥ 2 * (dist P M + dist P N + dist P L) := by
  sorry

end Erdos898
