import Mathlib

open Nat

namespace Erdos499

theorem erdos_499.variants.one_le_neg :
    ¬ (∀ n > 0, ∀ M ∈ doublyStochastic ℝ (Fin n), ∃ σ : Equiv.Perm (Fin n), (∀ i, M i (σ i) ≠ 0) ∧ 1 ≤ ∑ i, M i (σ i)) := by
  sorry

end Erdos499
