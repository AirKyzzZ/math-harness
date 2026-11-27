import Mathlib

open Configuration

namespace Erdos723

theorem erdos_723 :
    ∀ {P L : Type} (_: Membership P L) (_ : Fintype P) (_ : Fintype L), ∀ pp : ProjectivePlane P L, IsPrimePow pp.order := by
  sorry

end Erdos723
