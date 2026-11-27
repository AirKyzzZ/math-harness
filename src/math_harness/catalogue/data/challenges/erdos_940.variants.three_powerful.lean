import Mathlib

open Filter

namespace Erdos940

theorem erdos_940.variants.three_powerful :
    ∀ᶠ x in atTop, ∃ (S : Multiset ℕ), S.card ≤ 3 ∧ (∀ s ∈ S, (2).Full s) ∧ x = S.sum := by
  sorry

end Erdos940
