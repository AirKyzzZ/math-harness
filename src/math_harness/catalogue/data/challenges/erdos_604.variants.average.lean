import Mathlib

open Filter

open scoped EuclideanGeometry Finset

namespace Erdos604

noncomputable def pinnedDistinctDistances (n : ℕ) : ℕ :=
  sInf {m : ℕ | ∃ A : Finset ℝ², #A = n ∧ A.sup (distinctDistancesFrom A) = m}

theorem erdos_604.variants.average :
    ∃ C : ℝ, 0 < C ∧ ∀ᶠ n : ℕ in atTop, ∀ A : Finset ℝ², #A = n → C * (n : ℝ) ^ 2 / (n : ℝ).log.sqrt ≤ ((∑ x ∈ A, distinctDistancesFrom A x : ℕ) : ℝ) := by
  sorry

end Erdos604
