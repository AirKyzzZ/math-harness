import Mathlib

namespace Erdos549

theorem erdos_549 :
    ¬ ∀ (k : ℕ) (hk : 2 ≤ k) (T : SimpleGraph (Fin k ⊕ Fin (2 * k))), T.IsTree → (∀ x₁ x₂, ¬ T.Adj (Sum.inl x₁) (Sum.inl x₂)) → (∀ y₁ y₂, ¬ T.Adj (Sum.inr y₁) (Sum.inr y₂)) → SimpleGraph.diagonalGraphRamsey T = 4 * k - 1 := by
  sorry

-- TODO: Add variants of the problem.

end Erdos549
