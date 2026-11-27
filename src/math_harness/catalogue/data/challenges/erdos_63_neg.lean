import Mathlib

namespace Erdos63

theorem erdos_63_neg :
    ¬ (∀ {V : Type*} (G : SimpleGraph V), G.chromaticNumber = ⊤ → ∀ N : ℕ, ∃ n ≥ N, 2 ^ n ∈ G.cycleLengths) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos63
