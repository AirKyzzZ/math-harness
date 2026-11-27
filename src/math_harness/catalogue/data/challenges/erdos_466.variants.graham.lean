import Mathlib

open Filter Metric

namespace Erdos466

noncomputable def N (X δ : ℝ) : ℕ :=
  sSup {n | ∃ (c : EuclideanSpace ℝ (Fin 2)) (P : Finset (EuclideanSpace ℝ (Fin 2))),
    P.card = n ∧ ↑P ⊆ closedBall c X ∧
      (P : Set (EuclideanSpace ℝ (Fin 2))).Pairwise fun x y => δ ≤ distToNearestInt (dist x y)}

theorem erdos_466.variants.graham :
    ∀ X : ℝ, 1 ≤ X → Real.log X / 10 < N X (1 / 10) := by
  sorry

end Erdos466
