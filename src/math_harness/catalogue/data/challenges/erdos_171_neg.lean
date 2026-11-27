import Mathlib

open Filter

namespace Erdos171

theorem erdos_171_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ∀ t : ℕ, 1 ≤ t → ∀ᶠ N : ℕ in atTop, ∀ A : Finset (Fin N → Fin t), ε * t ^ N ≤ A.card → ∃ l : Combinatorics.Line (Fin t) (Fin N), ∀ i : Fin t, l i ∈ A) := by
  sorry

end Erdos171
