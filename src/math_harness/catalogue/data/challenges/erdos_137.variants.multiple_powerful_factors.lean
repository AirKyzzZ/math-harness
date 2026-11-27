import Mathlib

namespace Erdos137

theorem erdos_137.variants.multiple_powerful_factors (k : ℕ) :
    ∀ᶠ n in Filter.atTop, ∀ (m : ℕ) (hm : 0 < m), letI N := ∏ x ∈ Finset.Ioc m (m + n), x ∃ P : Finset ℕ, P.card = k ∧ ∀ p ∈ P, p.Prime ∧ p ∣ N ∧ ¬ p ^ 2 ∣ N := by
  sorry

end Erdos137
