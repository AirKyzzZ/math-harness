import Mathlib

open Filter

open scoped Topology

namespace Erdos967

noncomputable def summand (t : ℝ) (n : ℕ) : ℂ := 1 / (n : ℂ) ^ (1 + t * Complex.I : ℂ)

theorem erdos_967.variants.finite_neg :
    ¬ (∀ A : Finset ℕ, (∀ n ∈ A, 1 < n) → ∀ t : ℝ, 1 + (∑ n ∈ A, summand t n) ≠ 0) := by
  sorry

end Erdos967
