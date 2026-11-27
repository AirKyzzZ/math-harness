import Mathlib

namespace Erdos719

open Filter Asymptotics

theorem erdos_719 :
    ∀ r : ℕ, 2 ≤ r → ∀ (n : ℕ) (H : Finset (Finset (Fin n))), H.IsUniform r → ∃ D : Finset (Finset (Fin n)), H.IsCompleteHypergraphDecomposition r D ∧ D.card ≤ Hypergraph.cliqueExtremalNumber n r (r + 1) := by
  sorry

end Erdos719
