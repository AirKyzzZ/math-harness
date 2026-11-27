import Mathlib

namespace Erdos832

open Filter Asymptotics

theorem erdos_832_neg :
    ¬ (¬ ∀ r : ℕ, 3 ≤ r → ∀ᶠ k : ℕ in atTop, ∀ (n : ℕ) (H : Finset (Finset (Fin n))), H.IsUniform r → H.HasHypergraphChromaticNumber k → ((r - 1) * (k - 1) + 1).choose r ≤ H.card ∧ (H.card = ((r - 1) * (k - 1) + 1).choose r → ∃ S : Finset (Fin n), S.card = (r - 1) * (k - 1) + 1 ∧ H = S.powersetCard r)) := by
  sorry

end Erdos832
