import Mathlib

namespace Erdos965

theorem erdos_965.variants.generalization_neg :
    ¬ (¬ ∀ f : ℝ → Fin 2, ∃ k ≥ 2, ∃ A : Set ℝ, ¬ A.Countable ∧ ∀ s t : Finset ℝ, ↑s ⊆ A → ↑t ⊆ A → s.card = k → t.card = k → f (s.sum id) = f (t.sum id)) := by
  sorry

end Erdos965
