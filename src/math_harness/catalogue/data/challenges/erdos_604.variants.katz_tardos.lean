import Mathlib

open Filter

open scoped EuclideanGeometry Finset

namespace Erdos604

noncomputable def pinnedDistinctDistances (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ A : Finset ℝ², #A = n ∧ A.sup (distinctDistancesFrom A) = m}

theorem erdos_604.variants.katz_tardos :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ n : ℕ in atTop, (n : ℝ) ^ ((48 - 14 * Real.exp 1) / (55 - 16 * Real.exp 1) - ε) ≤ (pinnedDistinctDistances n : ℝ) := by
  sorry

end Erdos604
