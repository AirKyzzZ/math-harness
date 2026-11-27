import Mathlib

open Filter

open scoped Topology

namespace Erdos704

def unitDistanceGraph (n : ℕ) : SimpleGraph (EuclideanSpace ℝ (Fin n)) where
  Adj x y := dist x y = 1
  symm.symm x y := by simp [dist_comm]

theorem erdos_704.variants.larman_rogers_conjecture :
    ¬ Tendsto (fun n : ℕ ↦ ((unitDistanceGraph n).chromaticNumber.toNat : ℝ) ^ (1 / (n : ℝ))) atTop (𝓝 ((2 : ℝ) ^ ((3 : ℝ) / 2))) := by
  sorry

end Erdos704
