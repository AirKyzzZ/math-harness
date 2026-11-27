import Mathlib

namespace Erdos388

theorem erdos_388 :
    {(m₁, k₁, m₂, k₂) : ℕ × ℕ × ℕ × ℕ | 3 < k₁ ∧ 3 < k₂ ∧ m₁ + k₁ ≤ m₂ ∧ ∏ i ∈ Finset.Icc 1 k₁, (m₁ + i) = ∏ j ∈ Finset.Icc 1 k₂, (m₂ + j)}.Finite := by
  sorry

end Erdos388
