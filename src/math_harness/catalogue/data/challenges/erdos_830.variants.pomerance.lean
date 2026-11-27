import Mathlib

open scoped ArithmeticFunction.sigma

open Filter Real

namespace Erdos830

open scoped Classical in
noncomputable abbrev A (x : ℝ) : ℝ :=
  ((Finset.Icc 1 ⌊x⌋₊ ×ˢ Finset.Icc 1 ⌊x⌋₊).filter fun (a, b) ↦ a ≤ b ∧ IsAmicable a b).card

theorem erdos_830.variants.pomerance :
    ∀ᶠ x in atTop, A x ≤ x * rexp (- Real.nthRoot 3 x.log) := by
  sorry

end Erdos830
