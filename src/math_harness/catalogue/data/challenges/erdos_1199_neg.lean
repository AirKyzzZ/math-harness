import Mathlib

open Pointwise

namespace Erdos1199

theorem erdos_1199_neg :
    ¬ (∀ (color : ℕ → Fin 2), ∃ (A : Set ℕ), A.Infinite ∧ ∀ n ∈ (A+A), ∀ m ∈ (A+A), color n = color m) := by
  sorry

end Erdos1199
