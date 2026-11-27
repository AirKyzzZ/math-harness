import Mathlib

open SimpleGraph

namespace Erdos1008

theorem erdos_1008.variants.folkman (n : ℕ) :
    ((completeBipartiteGraph (Fin n) (Fin (n ^ 2))).edgeSet.ncard = n ^ 3) ∧ ∀ H ≤ completeBipartiteGraph (Fin n) (Fin (n ^ 2)), n ^ 2 + n.choose 2 < H.edgeSet.ncard → cycleGraph 4 ⊑ H := by
  sorry

end Erdos1008
