import Mathlib

open Filter SimpleGraph

namespace Erdos571

theorem erdos_571 :
    ∀ α : ℚ, 1 ≤ α → α < 2 → ∃ q : ℕ, ∃ G : SimpleGraph (Fin q), G.IsBipartite ∧ Asymptotics.IsTheta atTop (fun n : ℕ => (extremalNumber n G : ℝ)) (fun n : ℕ => (n : ℝ) ^ (α : ℝ)) := by
  sorry

end Erdos571
