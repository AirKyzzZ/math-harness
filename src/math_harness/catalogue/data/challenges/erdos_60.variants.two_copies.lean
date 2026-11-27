import Mathlib

namespace Erdos60

open SimpleGraph Filter

open scoped Real

theorem erdos_60.variants.two_copies :
    ∀ᶠ n : ℕ in atTop, ∀ (G : SimpleGraph (Fin n)) [DecidableRel G.Adj], (extremalNumber n (cycleGraph 4) < G.edgeFinset.card) → (2 ≤ { H' : G.Subgraph | Nonempty (H'.coe ≃g cycleGraph 4) }.ncard) := by
  sorry

end Erdos60
