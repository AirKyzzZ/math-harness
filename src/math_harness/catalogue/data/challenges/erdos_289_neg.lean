import Mathlib

open Asymptotics Filter Finset

namespace Erdos289

theorem erdos_289_neg :
    ¬ ((∀ᶠ k : ℕ in atTop, ∃ I : Fin k → ℕ × ℕ, (∀ i, (I i).1 < (I i).2) ∧ (∀ i j, i ≠ j → (I i).2 + 1 < (I j).1 ∨ (I j).2 + 1 < (I i).1) ∧ ∑ i, ∑ n ∈ .Icc (I i).1 (I i).2, (n⁻¹ : ℚ) = 1)) := by
  sorry

end Erdos289
