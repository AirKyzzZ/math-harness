import Mathlib

open Filter Metric

namespace Erdos466

noncomputable def N (X δ : ℝ) : ℕ :=
  sSup {n | ∃ (c : EuclideanSpace ℝ (Fin 2)) (P : Finset (EuclideanSpace ℝ (Fin 2))),
    P.card = n ∧ ↑P ⊆ closedBall c X ∧
      (P : Set (EuclideanSpace ℝ (Fin 2))).Pairwise fun x y => δ ≤ distToNearestInt (dist x y)}

theorem erdos_466.variants.sarkozy :
    ∃ δ₀ : ℝ, 0 < δ₀ ∧ ∀ δ : ℝ, 0 < δ → δ < δ₀ → ∀ᶠ X : ℝ in atTop, X ^ (1 / 2 - δ ^ (1 / 7 : ℝ)) < N X δ := by
  sorry

end Erdos466
