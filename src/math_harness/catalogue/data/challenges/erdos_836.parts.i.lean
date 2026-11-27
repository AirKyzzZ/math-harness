import Mathlib

namespace Erdos836

open Filter Asymptotics

theorem erdos_836.parts.i :
    ¬ ∃ C : ℝ, 0 < C ∧ ∀ r : ℕ, 2 ≤ r → ∀ (n : ℕ) (H : Finset (Finset (Fin n))), H.IsUniform r → H.HasHypergraphChromaticNumber 3 → (H : Set (Finset (Fin n))).Intersecting → ((H.biUnion id).card : ℝ) ≤ C * (r : ℝ) ^ 2 := by
  sorry

end Erdos836
