import Mathlib

namespace Erdos760

theorem erdos_760 :
    ∃ c > (0 : ℝ), ∀ (V : Type*) [Finite V] (G : SimpleGraph V) (m : ℕ), G.chromaticNumber = (m : ℕ∞) → ∃ H : G.Subgraph, ∃ k : ℕ, ((k : ℕ∞) ≤ H.coe.cochromaticNumber) ∧ (c * (m : ℝ) / Real.log (m : ℝ) ≤ (k : ℝ)) := by
  sorry

end Erdos760
