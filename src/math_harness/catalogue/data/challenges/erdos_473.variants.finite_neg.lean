import Mathlib

namespace Erdos473

theorem erdos_473.variants.finite_neg :
    ¬ (∀ n : ℕ, 2 ≤ n → ∃ a : Fin n ≃ Fin n, ∀ k : Fin n, ∀ h : k.val + 1 < n, ((a k).val + 1 + ((a ⟨k.val + 1, h⟩).val + 1)).Prime) := by
  sorry

end Erdos473
