import Mathlib

open Asymptotics Filter

namespace Erdos367

def B (r n : ℕ) : ℕ :=
  ∏ i ∈ n.factorization.support with r ≤ n.factorization i, i ^ n.factorization i

theorem erdos_367.variants.k_ge_three_lower :
    ∃ c > (0 : ℝ), ∃ᶠ (n : ℕ) in atTop, c * ((n : ℝ) ^ 2 * Real.log (n : ℝ)) ≤ ((∏ m ∈ .Ico n (n + 3), B 2 m : ℕ) : ℝ) := by
  sorry

end Erdos367
