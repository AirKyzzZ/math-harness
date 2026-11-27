import Mathlib

open Configuration

namespace Erdos723

theorem erdos_723.variants.leq_11 {P L : Type} [Membership P L] [Fintype P] [Fintype L] :
    ∀ pp : ProjectivePlane P L, pp.order ≤ 11 → IsPrimePow pp.order := by
  sorry

end Erdos723
