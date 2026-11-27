import Mathlib

namespace Erdos288

theorem erdos_288.variants.i2_card_eq_1_neg :
    ¬ (Set.Finite { (I, n₂) : (ℕ+ × ℕ+) × ℕ+ | I.1 ≤ I.2 ∧ ∃ n : ℕ+, ∑ n₁ ∈ Set.Icc I.1 I.2, (n₁⁻¹ : ℚ) + (n₂⁻¹ : ℚ) = n }) := by
  sorry

end Erdos288
