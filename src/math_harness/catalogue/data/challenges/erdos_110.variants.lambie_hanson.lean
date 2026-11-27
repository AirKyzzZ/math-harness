import Mathlib

open Filter

namespace Erdos110

theorem erdos_110.variants.lambie_hanson (f : ℕ → ℕ) :
    ∃ (V : Type 1) (G : SimpleGraph V), Erdos737.ChromaticNumberAlephOne G ∧ ∀ k : ℕ, 3 ≤ k → ∀ H : G.Subgraph, H.verts.Finite → H.verts.ncard < f k → H.coe.chromaticNumber < (k : ℕ∞) := by
  sorry

end Erdos110
