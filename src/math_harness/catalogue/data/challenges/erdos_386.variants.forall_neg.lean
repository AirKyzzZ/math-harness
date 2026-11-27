import Mathlib

namespace Erdos386

open Nat

theorem erdos_386.variants.forall_neg :
    ¬ (∀ k ≥ 2, ∃ᶠ n in .atTop, k ≤ n - 2 ∧ ∃ p q : ℕ, n.choose k = ∏ i ∈ .Ico p q, nth Nat.Prime i) := by
  sorry

end Erdos386
