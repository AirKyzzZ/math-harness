import Mathlib

namespace Erdos163

theorem erdos_163_neg :
    ¬ (∀ (d : ℕ), 1 ≤ d → ∃ C > (0 : ℝ), ∀ (V : Type) [Fintype V] (H : SimpleGraph V), H.IsDegenerate d → (SimpleGraph.diagonalGraphRamsey H : ℝ) ≤ C * Fintype.card V) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos163
