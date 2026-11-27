import Mathlib

open Polynomial Set

namespace Erdos477

theorem erdos_477.variants.degree_two_dvd_condition_b_ne_zero {a b c : ℤ} (ha : a ≠ 0) (hb : b ≠ 0) (hab : a ∣ b) :
    let f := a • X ^ 2 + b • X + C c ∀ A : Set ℤ, ∃ z, ¬ ∃! a ∈ A ×ˢ (Set.range f.eval), z = a.1 + a.2 := by
  sorry

end Erdos477
