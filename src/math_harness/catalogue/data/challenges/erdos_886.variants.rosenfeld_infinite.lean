import Mathlib

open Nat Filter

namespace Erdos886

noncomputable def Erdos886Divisors (n : ℕ) (ε : ℝ) (C : ℝ) : Finset ℕ :=
  (divisors n).filter (fun d =>
    (n : ℝ) ^ (1/2 : ℝ) < d ∧ (d : ℝ) < (n : ℝ) ^ (1/2 : ℝ) + C * (n : ℝ) ^ (1/2 - ε))

theorem erdos_886.variants.rosenfeld_infinite :
    Set.Infinite {n | 4 ≤ (Erdos886Divisors n (1/4) 16).card} := by
  sorry

end Erdos886
