import Mathlib

open Filter

namespace Erdos775

theorem erdos_775.variants.moon_moser :
    ∃ C : ℝ, ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), ((SimpleGraph.cliqueSizes G).ncard : ℝ) ≤ (n : ℝ) - Real.logb 2 (n : ℝ) + C := by
  sorry

end Erdos775
