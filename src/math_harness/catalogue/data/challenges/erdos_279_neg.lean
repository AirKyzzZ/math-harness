import Mathlib

namespace Erdos279

theorem erdos_279_neg :
    ¬ (∀ k : Nat, k ≥ 3 → ∃ a : Nat → Nat, ∃ N : Nat, (∀ p : Nat, p.Prime → a p < p) ∧ ∀ n ≥ N, ∃ p : Nat, ∃ t ≥ k, p.Prime ∧ n = a p + t * p) := by
  sorry

end Erdos279
