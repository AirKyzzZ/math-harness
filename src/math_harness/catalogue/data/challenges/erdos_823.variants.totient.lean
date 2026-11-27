import Mathlib

open Filter Topology

open scoped ArithmeticFunction.sigma Nat

namespace Erdos823

theorem erdos_823.variants.totient :
    ∀ α : ℝ, 1 ≤ α → ∃ n m : ℕ → ℕ, (∀ k, 0 < n k) ∧ (∀ k, 0 < m k) ∧ (∀ k, φ (n k) = φ (m k)) ∧ Tendsto (fun k ↦ (n k : ℝ) / m k) atTop (𝓝 α) := by
  sorry

end Erdos823
