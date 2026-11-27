import Mathlib

open Filter Asymptotics SimpleGraph

namespace Erdos147

open scoped Classical in
theorem erdos_147.variants.janzer_conjecture_neg :
    ¬ (∀ r : ℕ, 3 ≤ r → ∀ ε : ℝ, 0 < ε → ∃ (q : ℕ) (H : SimpleGraph (Fin q)), 0 < q ∧ H.IsRegularOfDegree r ∧ (fun n : ℕ => (extremalNumber n H : ℝ)) =O[atTop] fun n : ℕ => (n : ℝ) ^ (2 - 2 / (r : ℝ) + ε)) := by
  sorry

end Erdos147
