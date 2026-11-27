import Mathlib

namespace Erdos65

theorem erdos_65.parts.i :
    ∃ c > (0 : ℝ), ∀ᶠ k : ℝ in Filter.atTop, ∀ (n : ℕ) (V : Type) [Fintype V] (G : SimpleGraph V), 0 < n → Fintype.card V = n → (G.edgeSet.ncard : ℝ) = k * n → (∑ᶠ a ∈ G.cycleLengths, (1 : ℝ) / a) ≥ c * Real.log k := by
  sorry

-- TODO: Add variants of the problem.

end Erdos65
