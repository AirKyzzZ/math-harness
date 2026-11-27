import Mathlib

open Nat Filter BigOperators

namespace Erdos1108

def FactorialSums : Set ℕ :=
  {m : ℕ | ∃ S : Finset ℕ, (∀ n ∈ S, 0 < n) ∧ m = ∑ n ∈ S, n.factorial}

theorem erdos_1108.parts.i_neg :
    ¬ (∀ k ≥ 2, Set.Finite { a | a ∈ FactorialSums ∧ ∃ m : ℕ, m ^ k = a }) := by
  sorry

end Erdos1108
