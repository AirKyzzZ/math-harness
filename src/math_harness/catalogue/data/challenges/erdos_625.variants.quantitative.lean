import Mathlib

open Filter SimpleGraph

open scoped Topology

namespace Erdos625

theorem erdos_625.variants.quantitative :
    Tendsto (fun n : ℕ ↦ binomialRandom (Fin n) ⟨1 / 2, by norm_num⟩ {G | ((Real.log 2) ^ 2 / 4 * Real.log (200 / 153 : ℝ)) * n / (Real.log n) ^ 3 ≤ (G.chromaticNumber.toNat : ℝ) - G.cochromaticNumber.toNat}) atTop (𝓝 1) := by
  sorry

end Erdos625
