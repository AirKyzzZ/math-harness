import Mathlib

namespace Erdos312

theorem erdos_312 :
    ∃ (c : ℝ), 0 < c ∧ ∀ (K : ℝ), 1 < K → ∃ (N₀ : ℕ), ∀ (n : ℕ) (a : Fin n → ℕ), (n ≥ N₀ ∧ (∑ i : Fin n, (a i : ℝ)⁻¹) > K) → ∃ (S : Finset (Fin n)), 1 - Real.exp (-(c * K)) < (∑ i ∈ S, (a i : ℝ)⁻¹) ∧ ∑ i ∈ S, (a i : ℝ)⁻¹ ≤ 1 := by
  sorry

end Erdos312
