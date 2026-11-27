import Mathlib

namespace Erdos566

open SimpleGraph

theorem erdos_566 :
    ∀ (p : ℕ) (G : SimpleGraph (Fin p)), (∀ S : Finset (Fin p), 2 ≤ S.card → (G.induce S).edgeSet.ncard ≤ 2 * S.card - 3) → G.IsRamseySizeLinear := by
  sorry

end Erdos566
