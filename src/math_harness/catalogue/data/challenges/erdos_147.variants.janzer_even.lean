import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos147

open scoped Classical in
theorem erdos_147.variants.janzer_even (r : ℕ) (hr : 4 ≤ r) (heven : Even r) (ε : ℝ) (hε : 0 < ε) :
    ∃ (q : ℕ) (H : SimpleGraph (Fin q)), 0 < q ∧ H.IsBipartite ∧ H.IsRegularOfDegree r ∧ (fun n : ℕ => (extremalNumber n H : ℝ)) =O[atTop] fun n : ℕ => (n : ℝ) ^ (2 - 2 / (r : ℝ) + ε) := by
  sorry

end Erdos147
