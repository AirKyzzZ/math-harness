import Mathlib

open Filter Finset Real

open scoped Nat.Prime ArithmeticFunction.omega

namespace Erdos890

def omegaGt (k n : ℕ) : ℕ :=
  (n.primeFactors.filter (· > k)).card

local notation "ω_gt" => omegaGt

theorem erdos_890.parts.b_neg :
    ¬ (∀ k ≥ 1, limsup (fun n ↦ (∑ i ∈ range k, (ω (n + i) : EReal)) * (log (log n) / log n)) atTop = 1) := by
  sorry

end Erdos890
