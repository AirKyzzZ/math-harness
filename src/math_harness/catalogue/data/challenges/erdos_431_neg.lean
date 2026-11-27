import Mathlib

namespace Erdos431

open scoped Pointwise

open scoped symmDiff

theorem erdos_431_neg :
    ¬ (¬ ∃ A B : Set ℕ, A.Infinite ∧ B.Infinite ∧ (A + B : Set ℕ) =ᶠ[Filter.cofinite] {n | n.Prime}) := by
  sorry

end Erdos431
