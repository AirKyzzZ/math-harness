import Mathlib

open Nat Filter Finset

open scoped Topology Asymptotics

namespace Erdos726

theorem erdos_726 :
    (fun n : ℕ ↦ ∑ p ∈ (range (n + 1)).filter (fun p : ℕ ↦ p.Prime ∧ (p : ℝ) / 2 < ((n % p : ℕ) : ℝ)), (1 : ℝ) / (p : ℝ)) ~[atTop] (fun n : ℕ ↦ Real.log (Real.log (n : ℝ)) / 2) := by
  sorry

end Erdos726
