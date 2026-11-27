import Mathlib

open scoped Pointwise

open Set

namespace Erdos741

theorem erdos_741.variants.exact_density :
    ¬ ∀ A : Set ℕ, HasPosDensity (A + A) → ∃ A₁ A₂, A = A₁ ∪ A₂ ∧ Disjoint A₁ A₂ ∧ HasPosDensity (A₁ + A₁) ∧ HasPosDensity (A₂ + A₂) := by
  sorry

end Erdos741
