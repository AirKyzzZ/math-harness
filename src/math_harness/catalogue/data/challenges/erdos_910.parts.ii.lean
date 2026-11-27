import Mathlib

open scoped Cardinal

namespace Erdos910

theorem erdos_910.parts.ii :
    ∀ (n : ℕ) (X : Set (EuclideanSpace ℝ (Fin n))), IsConnected X → 1 < smallInductiveDimension X → 𝔠 < Cardinal.mk {Y : Set (EuclideanSpace ℝ (Fin n)) | Y ⊆ X ∧ IsConnected Y ∧ Y.Nontrivial} := by
  sorry

end Erdos910
