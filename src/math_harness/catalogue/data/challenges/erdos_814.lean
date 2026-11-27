import Mathlib

open Filter Real SimpleGraph

namespace Erdos814

open scoped Classical in
theorem erdos_814 :
    ∀ k ≥ 2, ∃ c > 0, ∀ n ≥ k - 1, ∀ G : SimpleGraph (Fin n), G.edgeFinset.card = (k - 1) * (n + 2 - k) + (k - 2).choose 2 + 1 → ∃ S : Finset (Fin n), S.Nonempty ∧ (S.card : ℝ) ≤ (1 - c) * n ∧ k ≤ (G.induce (S : Set (Fin n))).minDegree := by
  sorry

end Erdos814
