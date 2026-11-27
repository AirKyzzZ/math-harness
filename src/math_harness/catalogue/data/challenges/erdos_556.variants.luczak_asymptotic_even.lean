import Mathlib

open Filter

namespace Erdos556

open SimpleGraph

theorem erdos_556.variants.luczak_asymptotic_even :
    ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, Even n → (multicolourRamsey (cycleGraph n) 3 : ℝ) ≤ (3 + ε) * n := by
  sorry

end Erdos556
