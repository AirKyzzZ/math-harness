import Mathlib

namespace Erdos81

open SimpleGraph

theorem erdos_81 :
    ∃ C : ℝ, ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), G.IsChordal → ∃ P : Finset (Finset (Fin n)), G.IsCliqueEdgePartition P ∧ (P.card : ℝ) ≤ (n : ℝ) ^ 2 / 6 + C * n := by
  sorry

end Erdos81
