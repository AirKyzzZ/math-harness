import Mathlib

namespace Erdos7

open Set

theorem erdos_7 :
    ∃ (C : StrictCoveringSystem ℤ), ∀ i, ¬ C.moduli i ≤ Ideal.span {2} ∧ C.moduli i ≠ ⊤ := by
  sorry

end Erdos7
