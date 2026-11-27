import Mathlib

open Filter

namespace Erdos556

open SimpleGraph

theorem erdos_556.variants.kss_large_odd :
    ∀ᶠ n : ℕ in atTop, Odd n → multicolourRamsey (cycleGraph n) 3 = 4 * n - 3 := by
  sorry

end Erdos556
