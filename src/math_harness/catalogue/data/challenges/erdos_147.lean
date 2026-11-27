import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos147

theorem erdos_147 :
    ¬ ∀ (V : Type) [Fintype V] [Nonempty V] (H : SimpleGraph V) [DecidableRel H.Adj], H.IsBipartite → 2 ≤ H.minDegree → ∃ ε : ℝ, 0 < ε ∧ (fun n : ℕ => (n : ℝ) ^ (2 - 1 / ((H.minDegree : ℝ) - 1) + ε)) =O[atTop] fun n : ℕ => (extremalNumber n H : ℝ) := by
  sorry

end Erdos147
