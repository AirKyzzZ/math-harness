import Mathlib

namespace Erdos833

open Filter Asymptotics

theorem erdos_833 :
    ∃ c : ℝ, 0 < c ∧ ∀ r : ℕ, 2 ≤ r → ∀ (n : ℕ) (H : Finset (Finset (Fin n))), H.IsUniform r → H.HasHypergraphChromaticNumber 3 → ∃ v : Fin n, (1 + c) ^ r ≤ (H.hypergraphDegree v : ℝ) := by
  sorry

end Erdos833
