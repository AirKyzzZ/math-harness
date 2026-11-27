import Mathlib

namespace Erdos362

theorem erdos_362.variants.fixed_card_neg :
    ¬ (∃ C : ℝ, ∀ (A : Finset ℕ) (l t : ℕ), A.Nonempty → ({S ∈ A.powersetCard l | ∑ n ∈ S, n = t}.card : ℝ) ≤ C * 2 ^ A.card / (A.card : ℝ) ^ 2) := by
  sorry

end Erdos362
