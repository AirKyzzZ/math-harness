import Mathlib

open Filter

namespace Erdos87

theorem erdos_87.parts.ii_neg :
    ¬ (∃ c > (0 : ℝ), ∀ᶠ k : ℕ in atTop, ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.chromaticNumber = (k : ℕ∞) → (SimpleGraph.diagonalGraphRamsey G : ℝ) > c * (SimpleGraph.diagonalRamsey k : ℝ)) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos87
