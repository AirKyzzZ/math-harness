import Mathlib

open Filter Finset

open scoped Topology

namespace Erdos1137

theorem erdos_1137 :
    Tendsto (fun x ↦ (((range x).sup (fun n ↦ (primeGap n) * (primeGap (n - 1))) : ℕ) : ℝ) / (((range x).sup primeGap : ℕ) : ℝ) ^ 2) atTop (𝓝 0) := by
  sorry

end Erdos1137
