import Mathlib

open Filter

open scoped Topology

namespace Erdos704

def unitDistanceGraph (n : ℕ) : SimpleGraph (EuclideanSpace ℝ (Fin n)) where
  Adj x y := dist x y = 1
  symm.symm x y := by simp [dist_comm]

theorem erdos_704.parts.ii :
    ∃ L : ℝ, Tendsto (fun n : ℕ ↦ ((unitDistanceGraph n).chromaticNumber.toNat : ℝ) ^ (1 / (n : ℝ))) atTop (𝓝 L) := by
  sorry

end Erdos704
