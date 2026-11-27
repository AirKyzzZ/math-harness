import Mathlib

open Filter Asymptotics

open scoped ArithmeticFunction.sigma

namespace Erdos1061

noncomputable abbrev S (x : ℝ) : ℝ :=
  ((Finset.Icc 1 ⌊x⌋₊ ×ˢ Finset.Icc 1 ⌊x⌋₊).filter fun (a, b) ↦
      a + b ≤ x ∧ σ 1 a + σ 1 b = σ 1 (a + b)).card

theorem erdos_1061 :
    ∃ c : ℝ, 0 < c ∧ S ~[atTop] (fun x : ℝ ↦ c * x) := by
  sorry

end Erdos1061
