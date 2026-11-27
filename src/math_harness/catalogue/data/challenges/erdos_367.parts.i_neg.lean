import Mathlib

open Asymptotics Filter

namespace Erdos367

def B (r n : ℕ) : ℕ :=
  ∏ i ∈ n.factorization.support with r ≤ n.factorization i, i ^ n.factorization i

theorem erdos_367.parts.i_neg :
    ¬ (∀ k : ℕ, 1 ≤ k → ∃ e : ℕ → ℝ, e =o[atTop] (1 : ℕ → ℝ) ∧ ∀ᶠ n in atTop, ((∏ m ∈ .Ico n (n + k), B 2 m : ℕ) : ℝ) ≤ (n : ℝ) ^ (2 + e n)) := by
  sorry

end Erdos367
