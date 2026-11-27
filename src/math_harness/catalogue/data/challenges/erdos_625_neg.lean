import Mathlib

open Filter SimpleGraph

open scoped Topology

namespace Erdos625

theorem erdos_625_neg :
    ¬ (∀ K : ℝ, Tendsto (fun n : ℕ ↦ binomialRandom (Fin n) ⟨1 / 2, by norm_num⟩ {G | K ≤ (G.chromaticNumber.toNat : ℝ) - G.cochromaticNumber.toNat}) atTop (𝓝 1)) := by
  sorry

end Erdos625
