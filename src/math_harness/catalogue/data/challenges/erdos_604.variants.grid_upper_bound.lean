import Mathlib

open Filter

open scoped EuclideanGeometry Finset

namespace Erdos604

noncomputable def pinnedDistinctDistances (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ A : Finset ℝ², #A = n ∧ A.sup (distinctDistancesFrom A) = m}

theorem erdos_604.variants.grid_upper_bound :
    (fun n => (pinnedDistinctDistances n : ℝ)) =O[atTop] (fun n : ℕ => (n : ℝ) / (n : ℝ).log.sqrt) := by
  sorry

end Erdos604
