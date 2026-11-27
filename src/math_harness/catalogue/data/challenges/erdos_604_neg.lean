import Mathlib

open Filter

open scoped EuclideanGeometry Finset

namespace Erdos604

noncomputable def pinnedDistinctDistances (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ A : Finset ℝ², #A = n ∧ A.sup (distinctDistancesFrom A) = m}

theorem erdos_604_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, (n : ℝ) ^ (1 - ε) ≤ (pinnedDistinctDistances n : ℝ)) := by
  sorry

end Erdos604
