import Mathlib

open Nat

namespace Erdos849

theorem erdos_849_neg :
    ¬ (∀ t ≥ 1, ∃ a : ℕ, {n : ℕ | ∃ k ≥ 1, 2 * k ≤ n ∧ choose n k = a}.ncard = t) := by
  sorry

end Erdos849
