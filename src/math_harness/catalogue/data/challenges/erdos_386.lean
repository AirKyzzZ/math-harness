import Mathlib

namespace Erdos386

open Nat

theorem erdos_386 :
    ∃ᶠ n in .atTop, ∃ k ≥ 2, k ≤ n - 2 ∧ ∃ p q : ℕ, n.choose k = ∏ i ∈ .Ico p q, nth Nat.Prime i := by
  sorry

end Erdos386
