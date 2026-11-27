import Mathlib

open Filter

open scoped EuclideanGeometry Finset

namespace Erdos604

noncomputable def pinnedDistinctDistances (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ A : Finset ℝ², #A = n ∧ A.sup (distinctDistancesFrom A) = m}

theorem erdos_604.variants.sqrt_log :
    (fun n : ℕ => (n : ℝ) / (n : ℝ).log.sqrt) =O[atTop] (fun n => (pinnedDistinctDistances n : ℝ)) := by
  sorry

end Erdos604
