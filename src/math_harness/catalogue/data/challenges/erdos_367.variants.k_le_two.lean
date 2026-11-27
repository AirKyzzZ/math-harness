import Mathlib

open Asymptotics Filter

namespace Erdos367

def B (r n : ℕ) : ℕ :=
  ∏ i ∈ n.factorization.support with r ≤ n.factorization i, i ^ n.factorization i

theorem erdos_367.variants.k_le_two :
    ∀ k : ℕ, k ≤ 2 → (fun n ↦ ((∏ m ∈ .Ico n (n + k), B 2 m : ℕ) : ℝ)) =O[atTop] fun n ↦ (n : ℝ) ^ (2 : ℝ) := by
  sorry

end Erdos367
