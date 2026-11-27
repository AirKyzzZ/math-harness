import Mathlib

namespace Erdos903

open Filter Asymptotics

theorem erdos_903 :
    ∀ p : ℕ, IsPrimePow p → ∀ H : Finset (Finset (Fin (p ^ 2 + p + 1))), H.IsPairwiseBalancedDesign → p ^ 2 + p + 1 < H.card → p ^ 2 + p + 1 + p ≤ H.card := by
  sorry

end Erdos903
