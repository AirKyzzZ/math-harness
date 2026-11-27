import Mathlib

namespace Erdos83

theorem erdos_83.variants.extremal (n : ℕ) :
    ∃ F : Finset (Finset (Fin (4 * n))), (∀ A ∈ F, A.card = 2 * n) ∧ (∀ A ∈ F, ∀ B ∈ F, 2 ≤ (A ∩ B).card) ∧ F.card = ((4 * n).choose (2 * n) - (2 * n).choose n ^ 2) / 2 := by
  sorry

end Erdos83
