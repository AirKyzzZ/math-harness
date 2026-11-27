import Mathlib

open Filter

namespace Erdos775

theorem erdos_775.variants.spencer :
    ∃ C : ℝ, ∀ n : ℕ, ∃ G : SimpleGraph (Fin n), (n : ℝ) - Real.logb 2 (n : ℝ) - C ≤ ((SimpleGraph.cliqueSizes G).ncard : ℝ) := by
  sorry

end Erdos775
