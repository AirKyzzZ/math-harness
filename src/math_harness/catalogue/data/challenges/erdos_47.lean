import Mathlib

namespace Erdos47

open Filter

open scoped BigOperators

theorem erdos_47 :
    ∀ δ : ℝ, 0 < δ → ∀ᶠ N : ℕ in atTop, ∀ A : Finset ℕ, A ⊆ Finset.Icc 1 N → δ * Real.log (N : ℝ) < A.reciprocalSum → ∃ S : Finset ℕ, S ⊆ A ∧ S.reciprocalSum = 1 := by
  sorry

end Erdos47
