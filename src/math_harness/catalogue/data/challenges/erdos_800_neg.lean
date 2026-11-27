import Mathlib

namespace Erdos800

theorem erdos_800_neg :
    ¬ (∃ C > (0 : ℝ), ∀ (n : ℕ) (V : Type) [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj], Fintype.card V = n → (∀ u v, G.Adj u v → ¬(3 ≤ G.degree u ∧ 3 ≤ G.degree v)) → (SimpleGraph.diagonalGraphRamsey G : ℝ) ≤ C * n) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos800
