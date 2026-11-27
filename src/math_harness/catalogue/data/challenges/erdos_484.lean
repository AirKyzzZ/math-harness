import Mathlib

namespace Erdos484

open scoped Classical in
theorem erdos_484 :
    ∃ c : ℝ, 0 < c ∧ ∀ k : ℕ, 0 < k → ∃ N₀ : ℕ, ∀ N : ℕ, N₀ ≤ N → ∀ f : ℕ → Fin k, c * N ≤ (((Finset.Icc 1 N).filter fun n => ∃ a ∈ Finset.Icc 1 N, ∃ b ∈ Finset.Icc 1 N, a ≠ b ∧ f a = f b ∧ a + b = n).card : ℝ) := by
  sorry

end Erdos484
