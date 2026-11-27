import Mathlib

namespace Erdos81

open SimpleGraph

theorem erdos_81.variants.split :
    ∃ C : ℝ, ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), G.IsSplitGraph → ∃ P : Finset (Finset (Fin n)), G.IsCliqueEdgePartition P ∧ (P.card : ℝ) ≤ 3 * (n : ℝ) ^ 2 / 16 + C * n := by
  sorry

end Erdos81
