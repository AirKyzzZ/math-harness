import Mathlib

open Filter

namespace Erdos940

theorem erdos_940_neg :
    ¬ (∀ r ≥ 3, {n : ℕ | ∃ (S : Multiset ℕ), S.card ≤ r ∧ (∀ s ∈ S, r.Full s) ∧ n = S.sum}.HasDensity 0) := by
  sorry

end Erdos940
