import Mathlib

open Filter

open scoped Topology

namespace Erdos704

def unitDistanceGraph (n : ℕ) : SimpleGraph (EuclideanSpace ℝ (Fin n)) where
  Adj x y := dist x y = 1
  symm.symm x y := by simp [dist_comm]

theorem erdos_704.variants.raigorodskii :
    ∀ c ∈ Set.Ioo (0 : ℝ) 1.239, ∀ᶠ n : ℕ in atTop, ∀ k : ℕ, (unitDistanceGraph n).Colorable k → c ^ n ≤ (k : ℝ) := by
  sorry

end Erdos704
