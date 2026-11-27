import Mathlib

namespace Erdos58

theorem erdos_58 :
    ∀ {V : Type*} (G : SimpleGraph V) (k : ℕ), G.oddCycleLengths.Finite → G.oddCycleLengths.ncard ≤ k → G.chromaticNumber ≤ (2 * k + 2 : ℕ∞) ∧ (G.chromaticNumber = (2 * k + 2 : ℕ∞) ↔ (SimpleGraph.completeGraph (Fin (2 * k + 2))).IsContained G) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos58
