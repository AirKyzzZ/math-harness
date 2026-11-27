import Mathlib

open Filter Asymptotics

namespace Erdos292

def A : Set ℕ :=
  {n | ∃ S : Finset ℕ, S ⊆ Finset.Icc 1 n ∧ n ∈ S ∧ ∑ m ∈ S, (1 : ℚ) / m = 1}

theorem erdos_292.variants.two_mul :
    ∀ n ∈ A, 1 < n → 2 * n ∈ A := by
  sorry

end Erdos292
