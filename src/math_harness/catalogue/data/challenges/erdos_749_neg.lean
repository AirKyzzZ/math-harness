import Mathlib

open Set Pointwise AdditiveCombinatorics

namespace Erdos749

theorem erdos_749_neg :
    ¬ (∀ ε > (0 : ℝ), ∃ A : Set ℕ, 1 - ε ≤ lowerDensity (A + A) ∧ ((Nat.cast (R := ℝ) ∘ sumRep A) ≪ (fun n => (1: ℝ)))) := by
  sorry

-- TODO(firsching): add a "similar question" for the upper density.

end Erdos749
