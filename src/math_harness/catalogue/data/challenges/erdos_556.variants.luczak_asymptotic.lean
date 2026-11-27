import Mathlib

open Filter

namespace Erdos556

open SimpleGraph

theorem erdos_556.variants.luczak_asymptotic :
    ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (multicolourRamsey (cycleGraph n) 3 : ℝ) ≤ (4 + ε) * n := by
  sorry

end Erdos556
