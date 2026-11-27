import Mathlib

open Filter

namespace Erdos556

open SimpleGraph

theorem erdos_556.variants.benevides_skokan_large_even :
    ∀ᶠ n : ℕ in atTop, Even n → multicolourRamsey (cycleGraph n) 3 = 2 * n := by
  sorry

end Erdos556
