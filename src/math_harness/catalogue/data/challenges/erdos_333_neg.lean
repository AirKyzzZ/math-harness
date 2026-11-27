import Mathlib

open Filter Asymptotics

open scoped Pointwise

namespace Erdos333

theorem erdos_333_neg :
    ¬ (¬ ∀ A : Set ℕ, A.HasDensity 0 → ∃ B : Set ℕ, A ⊆ B + B ∧ (fun N => ((B ∩ Set.Icc 1 N).ncard : ℝ)) =o[atTop] fun N => Real.sqrt N) := by
  sorry

end Erdos333
