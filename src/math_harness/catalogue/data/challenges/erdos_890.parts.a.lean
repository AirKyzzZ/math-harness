import Mathlib

open Filter Finset Real

open scoped Nat.Prime ArithmeticFunction.omega

namespace Erdos890

def omegaGt (k n : ℕ) : ℕ :=
  (n.primeFactors.filter (· > k)).card

local notation "ω_gt" => omegaGt

theorem erdos_890.parts.a :
    ∀ k ≥ 1, liminf (fun n ↦ (∑ i ∈ range k, (ω_gt k (n + i) : EReal))) atTop ≤ k := by
  sorry

end Erdos890
