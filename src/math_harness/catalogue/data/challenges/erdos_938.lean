import Mathlib

open Nat

namespace Erdos938

theorem erdos_938 :
    {P : Finset ℕ | (P : Set ℕ).IsAPOfLength 3 ∧ ∃ k, P = {nth Powerful k, nth Powerful (k + 1), nth Powerful (k + 2)}}.Finite := by
  sorry

end Erdos938
