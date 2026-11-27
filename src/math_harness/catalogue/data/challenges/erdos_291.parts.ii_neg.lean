import Mathlib

open Nat Finset Set Filter

namespace Erdos291

def L (n : ℕ) : ℕ :=
  (Finset.Icc 1 n).lcm (fun x ↦ x)

theorem L_eval : L 1 = 1 ∧ L 2 = 2 ∧ L 3 = 6 ∧ L 4 = 12 := by decide

def a (n : ℕ) : ℕ :=
  ∑ k ∈ Finset.Icc 1 n, L n / k

theorem a_eval : a 1 = 1 ∧ a 2 = 3 ∧ a 3 = 11 ∧ a 4 = 25 := by decide

theorem erdos_291.parts.ii_neg :
    ¬ ({ n : ℕ | Nat.gcd (a n) (L n) > 1 }.Infinite) := by
  sorry

end Erdos291
