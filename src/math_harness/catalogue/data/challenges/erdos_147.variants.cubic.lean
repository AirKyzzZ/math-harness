import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos147

open scoped Classical in
theorem erdos_147.variants.cubic (ε : ℝ) (hε : 0 < ε) :
    ∃ (q : ℕ) (H : SimpleGraph (Fin q)), 0 < q ∧ H.IsBipartite ∧ H.IsRegularOfDegree 3 ∧ (fun n : ℕ => (extremalNumber n H : ℝ)) =O[atTop] fun n : ℕ => (n : ℝ) ^ (4 / 3 + ε : ℝ) := by
  sorry

end Erdos147
