import Mathlib

open Set

namespace Erdos197

theorem erdos_197 :
    ∃ A B : Set ℕ, IsCompl A B ∧ (∃ f : ℕ ≃ A, ¬HasMonotoneAP (Subtype.val ∘ f) 3) ∧ (∃ g : ℕ ≃ B, ¬HasMonotoneAP (Subtype.val ∘ g) 3) := by
  sorry

end Erdos197
