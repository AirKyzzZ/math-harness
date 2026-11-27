import Mathlib

open Asymptotics Filter

namespace Erdos367

def B (r n : ℕ) : ℕ :=
  ∏ i ∈ n.factorization.support with r ≤ n.factorization i, i ^ n.factorization i

theorem erdos_367.parts.ii :
    ¬ ∀ k : ℕ, 1 ≤ k → (fun n ↦ ((∏ m ∈ .Ico n (n + k), B 2 m : ℕ) : ℝ)) =O[atTop] fun n ↦ (n : ℝ) ^ (2 : ℝ) := by
  sorry

end Erdos367
