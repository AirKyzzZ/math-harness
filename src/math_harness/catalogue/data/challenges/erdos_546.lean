import Mathlib

namespace Erdos546

theorem erdos_546 :
    ∃ C > (0 : ℝ), ∀ (m : ℕ) (V : Type) [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj], (∀ v, 0 < G.degree v) → G.edgeSet.ncard = m → (SimpleGraph.diagonalGraphRamsey G : ℝ) ≤ 2 ^ (C * Real.sqrt m) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos546
