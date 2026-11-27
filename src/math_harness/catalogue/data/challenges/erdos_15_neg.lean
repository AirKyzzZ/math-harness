import Mathlib

namespace Erdos15

open Filter Topology

theorem erdos_15_neg :
    ¬ (∃ l : ℝ, Tendsto (fun N => ∑ k ∈ Finset.range N, (-1 : ℝ) ^ (k + 1) * (k + 1) / (k.nth Nat.Prime)) atTop (𝓝 l)) := by
  sorry

-- TODO: add the other statements from the additional material

end Erdos15
