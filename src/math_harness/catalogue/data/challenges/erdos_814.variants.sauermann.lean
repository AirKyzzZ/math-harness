import Mathlib

open Filter Real SimpleGraph

namespace Erdos814

open scoped Classical in
theorem erdos_814.variants.sauermann :
    ∃ C > 0, ∀ k ≥ 2, ∀ n ≥ k - 1, ∀ G : SimpleGraph (Fin n), (k - 1) * (n + 2 - k) + (k - 2).choose 2 + 1 ≤ G.edgeFinset.card → ∃ S : Finset (Fin n), S.Nonempty ∧ (S.card : ℝ) ≤ (1 - C / k ^ 3) * n ∧ k ≤ (G.induce (S : Set (Fin n))).minDegree := by
  sorry

end Erdos814
