import Mathlib

open Filter

namespace Erdos570

theorem erdos_570 :
    ∀ (k : ℕ) (hk : 3 ≤ k), ∀ᶠ (m : ℕ) in atTop, ∀ (W : Type) [Fintype W] (H : SimpleGraph W) [DecidableRel H.Adj], (∀ v, 0 < H.degree v) → H.edgeSet.ncard = m → SimpleGraph.graphRamsey (SimpleGraph.cycleGraph k) H ≤ 2 * m + (k - 1) / 2 := by
  sorry

-- TODO: Add variants of the problem.

end Erdos570
