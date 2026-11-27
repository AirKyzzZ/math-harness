import Mathlib

namespace Erdos2

theorem erdos_2 :
    ¬ ∀ B : ℕ, ∃ c : StrictCoveringSystem ℤ, ∀ i, ∃ m : ℕ, c.moduli i = Ideal.span {(m : ℤ)} ∧ B < m := by
  sorry

end Erdos2
