import Mathlib

open Nat

namespace Erdos1058

def IsSolution (n : ℕ) : Prop :=
  0 < n ∧ ∃ k : ℕ, (if k = 0 then 1 else nth Nat.Prime (k - 1)) ≤ n ∧
    n < nth Nat.Prime k ∧
      ∀ r : ℕ, r.Prime → r ∣ n ! + 1 → r = nth Nat.Prime k ∨ r = nth Nat.Prime (k + 1)

theorem erdos_1058 :
    {n | IsSolution n}.Finite := by
  sorry

end Erdos1058
