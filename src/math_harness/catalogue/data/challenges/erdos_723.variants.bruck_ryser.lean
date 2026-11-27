import Mathlib

open Configuration

namespace Erdos723

theorem erdos_723.variants.bruck_ryser {P L : Type} [Membership P L] [Fintype P] [Fintype L] (n : ℕ) (pp : ProjectivePlane P L) (hpp : pp.order = n) :
    (n ≡ 1 [MOD 4] ∨ n ≡ 2 [MOD 4]) → ∃ a b, n = a ^ 2 + b ^ 2 := by
  sorry

end Erdos723
