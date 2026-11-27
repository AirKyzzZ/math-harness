import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos113

theorem erdos_113_neg :
    ¬ (¬ ∀ (V : Type) [Fintype V] (G : SimpleGraph V), G.IsBipartite → (((fun n : ℕ => (extremalNumber n G : ℝ)) =O[atTop] fun n : ℕ => (n : ℝ) ^ (3 / 2 : ℝ)) ↔ G.IsDegenerate 2)) := by
  sorry

end Erdos113
