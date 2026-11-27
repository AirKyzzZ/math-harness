import Mathlib

open Filter

namespace Erdos87

theorem erdos_87.parts.i_neg :
    ¬ (∀ ε > (0 : ℝ), ε < 1 → ∀ᶠ k : ℕ in atTop, ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.chromaticNumber = (k : ℕ∞) → (SimpleGraph.diagonalGraphRamsey G : ℝ) > (1 - ε) ^ k * (SimpleGraph.diagonalRamsey k : ℝ)) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos87
