import Mathlib

open Filter Finset

namespace Erdos1033

theorem erdos_1033.variants.three_halves_neg :
    ¬ (¬ ∀ n : ℕ, ∀ (G : SimpleGraph (Fin n)) [DecidableRel G.Adj], n ^ 2 < 4 * #G.edgeFinset → ∃ t, G.IsNClique 3 t ∧ 3 * n ≤ 2 * ∑ v ∈ t, G.degree v) := by
  sorry

end Erdos1033
