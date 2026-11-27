import Mathlib

namespace Erdos60

open SimpleGraph Filter

open scoped Real

theorem erdos_60.variants.he_ma_yang :
    ∃ c : ℝ, c > 0 ∧ ∀ (q : ℕ) (_hq : q.isPowerOfTwo), ∀ (G : SimpleGraph (Fin (q^2 + q + 1))) [DecidableRel G.Adj], (extremalNumber (q^2 + q + 1) (cycleGraph 4) < G.edgeFinset.card) → (c * Real.sqrt ((q^2 + q + 1) : ℝ) ≤ ({ H' : G.Subgraph | Nonempty (H'.coe ≃g cycleGraph 4) }.ncard : ℝ)) := by
  sorry

end Erdos60
