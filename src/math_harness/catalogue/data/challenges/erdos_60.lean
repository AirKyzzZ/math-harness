import Mathlib

namespace Erdos60

open SimpleGraph Filter

open scoped Real

theorem erdos_60 :
    ∃ c : ℝ, c > 0 ∧ ∀ᶠ n : ℕ in atTop, ∀ (G : SimpleGraph (Fin n)) [DecidableRel G.Adj], (extremalNumber n (cycleGraph 4) < G.edgeFinset.card) → (c * Real.sqrt (n : ℝ) ≤ ({ H' : G.Subgraph | Nonempty (H'.coe ≃g cycleGraph 4) }.ncard : ℝ)) := by
  sorry

end Erdos60
