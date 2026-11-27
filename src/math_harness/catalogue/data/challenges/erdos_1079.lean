import Mathlib

open SimpleGraph

namespace Erdos1079

open scoped Classical in
theorem erdos_1079 :
    ∀ r : ℕ, 4 ≤ r → ∃ c : ℝ, 0 < c ∧ ∀ n : ℕ, 2 ≤ n → ∀ G : SimpleGraph (Fin n), extremalNumber n (completeGraph (Fin r)) ≤ G.edgeSet.ncard → ∃ v : Fin n, c * n ≤ G.degree v ∧ extremalNumber (G.degree v) (completeGraph (Fin (r - 1))) ≤ {e ∈ G.edgeSet | ∀ x ∈ e, G.Adj v x}.ncard := by
  sorry

end Erdos1079
