import Mathlib

open Filter Real

open scoped ArithmeticFunction.omega

namespace Erdos1203

noncomputable def F (n : ℕ) : ℝ :=
  ⨆ k : ℕ, (ω (n + k) : ℝ) * (log (log (k : ℝ)) / log (k : ℝ))

theorem erdos_1203.variants.lower_bound :
    ∀ ε > 0, ∀ᶠ n in atTop, F n ≥ 1 - ε := by
  sorry

end Erdos1203
