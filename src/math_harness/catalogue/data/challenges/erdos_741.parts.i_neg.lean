import Mathlib

open scoped Pointwise

open Set

namespace Erdos741

theorem erdos_741.parts.i_neg :
    ¬ (∀ A : Set ℕ, 0 < upperDensity (A + A) → ∃ A₁ A₂, A = A₁ ∪ A₂ ∧ Disjoint A₁ A₂ ∧ 0 < upperDensity (A₁ + A₁) ∧ 0 < upperDensity (A₂ + A₂)) := by
  sorry

end Erdos741
