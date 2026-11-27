import Mathlib

open Filter

open scoped Topology

namespace Erdos967

noncomputable def summand (t : ℝ) (n : ℕ) : ℂ := 1 / (n : ℂ) ^ (1 + t * Complex.I : ℂ)

theorem erdos_967.variants.two_three_five_neg :
    ¬ (∀ t : ℝ, 1 + (∑ n ∈ ({2, 3, 5} : Finset ℕ), summand t n) ≠ 0) := by
  sorry

end Erdos967
