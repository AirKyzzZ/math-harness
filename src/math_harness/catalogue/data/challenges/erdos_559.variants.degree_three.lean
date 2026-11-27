import Mathlib

open Filter Real SimpleGraph

namespace Erdos559

open scoped Classical in
theorem erdos_559.variants.degree_three :
    ¬ ∃ C : ℝ, ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.maxDegree ≤ 3 → (sizeRamsey G G : ℝ) ≤ C * Fintype.card V := by
  sorry

end Erdos559
