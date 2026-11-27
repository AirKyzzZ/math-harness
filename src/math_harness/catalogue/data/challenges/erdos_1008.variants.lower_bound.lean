import Mathlib

open SimpleGraph

namespace Erdos1008

theorem erdos_1008.variants.lower_bound :
    ∃ c > (0 : ℝ), ∀ (V : Type) [Fintype V] (G : SimpleGraph V), ∃ H ≤ G, (cycleGraph 4).Free H ∧ c * (G.edgeSet.ncard : ℝ) ^ (1 / 2 : ℝ) ≤ (H.edgeSet.ncard : ℝ) := by
  sorry

end Erdos1008
