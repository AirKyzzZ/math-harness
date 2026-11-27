import Mathlib

open Nat

namespace Erdos499

theorem erdos_499_neg :
    ¬ ((∀ n, ∀ M ∈ doublyStochastic ℝ (Fin n), ∃ σ : Equiv.Perm (Fin n), n ^ (- n : ℤ) ≤ ∏ i, M i (σ i))) := by
  sorry

end Erdos499
