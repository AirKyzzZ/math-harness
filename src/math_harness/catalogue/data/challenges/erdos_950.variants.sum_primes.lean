import Mathlib

open Filter

open scoped Asymptotics Nat.Prime

namespace Erdos950

noncomputable def f (n : ℕ) : ℝ :=
  ∑ p ∈ (Finset.range n).filter Prime, (1 : ℝ) / (n - p : ℝ)

theorem erdos_950.variants.sum_primes :
    (fun x : ℕ ↦ ∑ p ∈ (Finset.range x).filter Prime, (f p) ^ 2) ~[atTop] fun x ↦ (π x : ℝ) := by
  sorry

end Erdos950
