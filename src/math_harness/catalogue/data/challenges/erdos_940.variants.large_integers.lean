import Mathlib

open Filter

namespace Erdos940

theorem erdos_940.variants.large_integers :
    ∀ r ≥ 3, ¬ (∀ᶠ x in atTop, ∃ (S : Multiset ℕ), S.card ≤ r ∧ (∀ s ∈ S, r.Full s) ∧ x = S.sum) := by
  sorry

end Erdos940
