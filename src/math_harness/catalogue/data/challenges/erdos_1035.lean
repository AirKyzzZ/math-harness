import Mathlib

namespace Erdos1035

theorem erdos_1035 :
    ∃ c > 0, ∀ n : ℕ, ∀ (G : SimpleGraph (Fin (2 ^ n))) [DecidableRel G.Adj], (∀ v, (G.degree v : ℝ) > (1 - c) * 2 ^ n) → (SimpleGraph.hypercube n).IsContained G := by
  sorry

end Erdos1035
