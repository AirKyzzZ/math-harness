import Mathlib

namespace Erdos751

theorem erdos_751.variants.bondy_vince {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] (hG : 3 ≤ G.minDegree) :
    ∃ m ∈ G.cycleLengths, ∃ m' ∈ G.cycleLengths, m < m' ∧ m' ≤ m + 2 := by
  sorry

end Erdos751
