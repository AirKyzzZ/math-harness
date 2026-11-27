import Mathlib

open scoped Nat

namespace Erdos727

theorem erdos_727.variants.k_1_neg :
    ¬ (letI k := 1 Set.Infinite {n : ℕ | (n + k)! ^ 2 ∣ (2 * n)!}) := by
  sorry

end Erdos727
