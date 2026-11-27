import Mathlib

namespace Erdos388

theorem erdos_388.variants.general (a b : ℕ) (ha : 0 < a) (hb : 0 < b) :
    {(m₁, k₁, m₂, k₂) : ℕ × ℕ × ℕ × ℕ | 2 < k₁ ∧ 2 < k₂ ∧ m₁ + k₁ ≤ m₂ ∧ a * ∏ i ∈ Finset.Icc 1 k₁, (m₁ + i) = b * ∏ j ∈ Finset.Icc 1 k₂, (m₂ + j)}.Finite := by
  sorry

end Erdos388
