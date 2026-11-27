import Mathlib

open scoped Cardinal

namespace Erdos910

theorem erdos_910.parts.i_neg :
    ¬ (∀ (n : ℕ) (X : Set (EuclideanSpace ℝ (Fin n))), IsConnected X → X.Nontrivial → ∃ Y ⊆ X, IsConnected Y ∧ Y.Nontrivial ∧ ¬ Nonempty (Y ≃ₜ X)) := by
  sorry

end Erdos910
