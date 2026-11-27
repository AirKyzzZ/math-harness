import Mathlib

open Filter SimpleGraph

namespace Erdos801

theorem erdos_801_neg :
    ¬ (∃ c : ℝ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), (G.indepNum : ℝ) ≤ √n → ∃ S : Finset (Fin n), (S.card : ℝ) ≤ √n ∧ c * √n * Real.log n ≤ (G.induce (S : Set (Fin n))).edgeSet.ncard) := by
  sorry

end Erdos801
