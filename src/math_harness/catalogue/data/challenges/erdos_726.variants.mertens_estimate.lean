import Mathlib

open Nat Filter Finset

open scoped Topology Asymptotics

namespace Erdos726

theorem erdos_726.variants.mertens_estimate :
    (fun n : ℕ ↦ ∑ p ∈ (range (n + 1)).filter (fun p ↦ p.Prime), (1 : ℝ) / ((p : ℕ) : ℝ)) ~[atTop] (fun n : ℕ ↦ Real.log (Real.log (n : ℝ))) := by
  sorry

end Erdos726
