import Mathlib

open Filter

namespace Erdos463

theorem erdos_463 :
    ∃ (f : ℕ → ℕ) (_ : Tendsto f atTop atTop), ∀ᶠ n in atTop, ∃ m, m.Composite ∧ n + f n < m ∧ m < n + m.minFac := by
  sorry

end Erdos463
