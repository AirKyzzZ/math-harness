import Mathlib

namespace Erdos79

open scoped Classical in
theorem erdos_79 :
    ∀ (N : ℕ), ∃ (n : ℕ) (_ : N ≤ n) (G : SimpleGraph (Fin n)), ¬ G.IsRamseySizeLinear ∧ ∀ H : G.Subgraph, H < ⊤ → H.coe.IsRamseySizeLinear := by
  sorry

-- TODO: Add variants of the problem.

end Erdos79
