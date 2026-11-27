import Mathlib

open Filter Real SimpleGraph

namespace Erdos559

open scoped Classical in
theorem erdos_559_neg :
    ¬ (¬ ∀ d : ℕ, ∃ C : ℝ, ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.maxDegree ≤ d → (sizeRamsey G G : ℝ) ≤ C * Fintype.card V) := by
  sorry

end Erdos559
