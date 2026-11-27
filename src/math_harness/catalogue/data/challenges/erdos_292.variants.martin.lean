import Mathlib

open Filter Asymptotics

namespace Erdos292

def A : Set ℕ :=
  {n | ∃ S : Finset ℕ, S ⊆ Finset.Icc 1 n ∧ n ∈ S ∧ ∑ m ∈ S, (1 : ℚ) / m = 1}

theorem erdos_292.variants.martin :
    (fun x : ℕ ↦ ((Aᶜ ∩ Set.Icc 1 x).ncard : ℝ) / x) =Θ[atTop] fun x ↦ Real.log (Real.log x) / Real.log x := by
  sorry

end Erdos292
