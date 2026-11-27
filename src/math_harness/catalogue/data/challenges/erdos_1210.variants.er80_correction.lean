import Mathlib

open Finset

namespace Erdos1210

theorem erdos_1210.variants.er80_correction :
    ∃ C : ℝ, ∀ n m : ℕ, n < m → ∑ q ∈ (Ioc n m).filter Prime, (1 / ((q : ℝ) - n)) < (∑ p ∈ (range (m - n)).filter Prime, (1 / (p : ℝ))) + C := by
  sorry

end Erdos1210
