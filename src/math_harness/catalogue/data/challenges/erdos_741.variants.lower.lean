import Mathlib

open scoped Pointwise

open Set

namespace Erdos741

theorem erdos_741.variants.lower :
    ∀ A : Set ℕ, 0 < lowerDensity (A + A) → ∃ A₁ A₂, A = A₁ ∪ A₂ ∧ Disjoint A₁ A₂ ∧ 0 < lowerDensity (A₁ + A₁) ∧ 0 < lowerDensity (A₂ + A₂) := by
  sorry

end Erdos741
