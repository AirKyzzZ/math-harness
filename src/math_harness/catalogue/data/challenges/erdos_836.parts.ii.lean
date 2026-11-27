import Mathlib

namespace Erdos836

open Filter Asymptotics

theorem erdos_836.parts.ii :
    ∃ c : ℝ, 0 < c ∧ ∀ r : ℕ, 2 ≤ r → ∀ (n : ℕ) (H : Finset (Finset (Fin n))), H.IsUniform r → H.HasHypergraphChromaticNumber 3 → (H : Set (Finset (Fin n))).Intersecting → ∃ e ∈ H, ∃ f ∈ H, e ≠ f ∧ c * r ≤ ((e ∩ f).card : ℝ) := by
  sorry

end Erdos836
