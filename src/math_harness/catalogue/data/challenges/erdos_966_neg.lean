import Mathlib

namespace Erdos966

theorem erdos_966_neg :
    ¬ (∀ k r : ℕ, 2 ≤ k → 2 ≤ r → ∃ A : Set ℕ, A.IsAPOfLengthFree (k + 1) ∧ ∀ coloring : A → Fin r, ContainsMonoAPofLength coloring k) := by
  sorry

end Erdos966
