import Mathlib

open Filter Metric

namespace Erdos466

noncomputable def N (X δ : ℝ) : ℕ :=
  sSup {n | ∃ (c : EuclideanSpace ℝ (Fin 2)) (P : Finset (EuclideanSpace ℝ (Fin 2))),
    P.card = n ∧ ↑P ⊆ closedBall c X ∧
      (P : Set (EuclideanSpace ℝ (Fin 2))).Pairwise fun x y => δ ≤ distToNearestInt (dist x y)}

theorem erdos_466 :
    ∃ δ : ℝ, 0 < δ ∧ Tendsto (fun X ↦ N X δ) atTop atTop := by
  sorry

end Erdos466
