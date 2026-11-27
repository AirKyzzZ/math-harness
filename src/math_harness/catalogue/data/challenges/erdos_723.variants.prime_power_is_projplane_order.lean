import Mathlib

open Configuration

namespace Erdos723

theorem erdos_723.variants.prime_power_is_projplane_order :
    ∀ n, IsPrimePow n → ∃ (P L : Type) (_ : Membership P L) (_ : Fintype P) (_ : Fintype L) (pp : ProjectivePlane P L), pp.order = n := by
  sorry

end Erdos723
