import Mathlib

namespace Erdos310

theorem erdos_310.variants.liu_sawhney :
    ∃ C : ℝ, ∀ ε : ℝ, 0 < ε → ∀ᶠ N : ℕ in Filter.atTop, ∀ α : ℝ, Real.log N ^ (-(1 / 7 : ℝ) + ε) ≤ α → α ≤ 1 / 2 → ∀ A ⊆ Finset.Icc 1 N, α * N ≤ A.card → ∃ S ⊆ A, ∃ a b : ℕ, 0 < a ∧ a ≤ b ∧ (b : ℝ) ≤ Real.exp (C / α) ∧ ∑ n ∈ S, (1 / n : ℚ) = a / b := by
  sorry

end Erdos310
