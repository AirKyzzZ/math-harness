import Mathlib

namespace Erdos751

theorem erdos_751.variants.finite {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] (hG : (4 : ℕ∞) ≤ G.chromaticNumber) :
    ∃ m ∈ G.cycleLengths, ∃ m' ∈ G.cycleLengths, m < m' ∧ m' ≤ m + 2 := by
  sorry

end Erdos751
