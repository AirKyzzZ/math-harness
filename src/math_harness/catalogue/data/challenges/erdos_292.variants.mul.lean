import Mathlib

open Filter Asymptotics

namespace Erdos292

def A : Set ℕ :=
  {n | ∃ S : Finset ℕ, S ⊆ Finset.Icc 1 n ∧ n ∈ S ∧ ∑ m ∈ S, (1 : ℚ) / m = 1}

theorem erdos_292.variants.mul :
    ∀ m ∈ A, ∀ n ∈ A, m * n ∈ A := by
  sorry

end Erdos292
