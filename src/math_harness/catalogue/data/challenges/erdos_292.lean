import Mathlib

open Filter Asymptotics

namespace Erdos292

def A : Set ℕ :=
  {n | ∃ S : Finset ℕ, S ⊆ Finset.Icc 1 n ∧ n ∈ S ∧ ∑ m ∈ S, (1 : ℚ) / m = 1}

theorem erdos_292 :
    A.HasDensity 1 := by
  sorry

end Erdos292
