import Mathlib

namespace Erdos1009

theorem erdos_1009_neg :
    ¬ (∀ c : ℝ, 0 < c → ∃ f : ℕ, ∀ (n k : ℕ) (G : SimpleGraph (Fin n)), n ^ 2 / 4 + k ≤ G.edgeSet.ncard → (k : ℝ) < c * n → ∃ T : Finset (Finset (Fin n)), (∀ t ∈ T, G.IsNClique 3 t) ∧ (T : Set (Finset (Fin n))).Pairwise (fun s t => (s ∩ t).card ≤ 1) ∧ k ≤ T.card + f) := by
  sorry

end Erdos1009
