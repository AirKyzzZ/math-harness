import Mathlib

namespace Erdos395

noncomputable def signedSumCount {n : ℕ} (z : Fin n → ℂ) (r : ℝ) : ℕ :=
  {ε : Fin n → ℤ | (∀ i, ε i = -1 ∨ ε i = 1) ∧ ‖∑ i, (ε i : ℂ) * z i‖ ≤ r}.ncard

theorem erdos_395.variants.sharp :
    ∃ C : ℝ, ∀ n : ℕ, 0 < n → ∃ z : Fin n → ℂ, (∀ i, ‖z i‖ = 1) ∧ (signedSumCount z √2 : ℝ) / 2 ^ n ≤ C / n := by
  sorry

end Erdos395
