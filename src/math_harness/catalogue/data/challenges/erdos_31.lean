import Mathlib

namespace Erdos31

open Filter

open scoped Pointwise

theorem erdos_31 :
    ∀ A : Set ℕ, A.Infinite → ∃ B : Set ℕ, B.HasDensity 0 ∧ ∀ᶠ n in atTop, n ∈ A + B := by
  sorry

end Erdos31
