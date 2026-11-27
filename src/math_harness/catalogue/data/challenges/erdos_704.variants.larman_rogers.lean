import Mathlib

open Filter

open scoped Topology

namespace Erdos704

def unitDistanceGraph (n : ℕ) : SimpleGraph (EuclideanSpace ℝ (Fin n)) where
  Adj x y := dist x y = 1
  symm.symm x y := by simp [dist_comm]

theorem erdos_704.variants.larman_rogers :
    ∀ C > (3 : ℝ), ∀ᶠ n : ℕ in atTop, ∃ k : ℕ, (unitDistanceGraph n).Colorable k ∧ (k : ℝ) ≤ C ^ n := by
  sorry

end Erdos704
