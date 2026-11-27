import Mathlib

open Filter Real

open scoped ArithmeticFunction.omega

namespace Erdos1203

noncomputable def F (n : ℕ) : ℝ :=
  ⨆ k : ℕ, (ω (n + k) : ℝ) * (log (log (k : ℝ)) / log (k : ℝ))

theorem erdos_1203_neg :
    ¬ (Tendsto F atTop atTop) := by
  sorry

end Erdos1203
