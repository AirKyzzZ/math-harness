import Mathlib

open Nat Filter

namespace Erdos886

noncomputable def Erdos886Divisors (n : ℕ) (ε : ℝ) (C : ℝ) : Finset ℕ :=
  (divisors n).filter (fun d =>
    (n : ℝ) ^ (1/2 : ℝ) < d ∧ (d : ℝ) < (n : ℝ) ^ (1/2 : ℝ) + C * (n : ℝ) ^ (1/2 - ε))

theorem erdos_886.variants.rosenfeld_bound :
    ∀ C > 0, ∀ᶠ (n : ℕ) in atTop, ((divisors n).filter (fun (d : ℕ) => (n : ℝ) ^ (1 / 2 : ℝ) ≤ (d : ℝ) ∧ (d : ℝ) ≤ (n : ℝ) ^ (1 / 2 : ℝ) + C * (n : ℝ) ^ (1 / 4 : ℝ))).card ≤ 1 + C ^ 2 := by
  sorry

end Erdos886
