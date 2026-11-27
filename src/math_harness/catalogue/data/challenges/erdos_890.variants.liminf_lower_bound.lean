import Mathlib

open Filter Finset Real

open scoped Nat.Prime ArithmeticFunction.omega

namespace Erdos890

def omegaGt (k n : ℕ) : ℕ :=
  (n.primeFactors.filter (· > k)).card

local notation "ω_gt" => omegaGt

theorem erdos_890.variants.liminf_lower_bound (k : ℕ) :
    liminf (fun n ↦ (∑ i ∈ range k, (ω (n + i) : EReal))) atTop ≥ k + π k - 1 := by
  sorry

end Erdos890
