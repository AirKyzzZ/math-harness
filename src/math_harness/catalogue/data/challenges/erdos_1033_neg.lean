import Mathlib

open Filter Finset

namespace Erdos1033

theorem erdos_1033_neg :
    ¬ (¬ ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, ∀ (G : SimpleGraph (Fin n)) [DecidableRel G.Adj], n ^ 2 < 4 * #G.edgeFinset → ∃ t, G.IsNClique 3 t ∧ (2 * (Real.sqrt 3 - 1) - ε) * n ≤ ∑ v ∈ t, (G.degree v : ℝ)) := by
  sorry

end Erdos1033
