import Mathlib

open Real Set

open scoped NNReal

namespace Erdos234

theorem erdos_234_neg :
    ¬ (∃ f : ℝ≥0 → ℝ, Continuous f ∧ ∀ c : ℝ≥0, HasDensity {n : ℕ | primeGap n / log n < c} (f c)) := by
  sorry

end Erdos234
