import Mathlib

namespace Erdos386

open Nat

theorem erdos_386.variants.two_neg :
    ¬ (∃ᶠ n in .atTop, 2 ≤ n - 2 ∧ ∃ p q : ℕ, n.choose 2 = ∏ i ∈ .Ico p q, nth Nat.Prime i) := by
  sorry

end Erdos386
