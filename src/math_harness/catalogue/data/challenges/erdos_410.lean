import Mathlib

open ArithmeticFunction Filter

namespace Erdos410

theorem erdos_410 :
    ∀ n > 1, Tendsto (fun k : ℕ ↦ ((sigma 1)^[k] n : ℝ) ^ (1 / (k : ℝ))) atTop atTop := by
  sorry

end Erdos410
