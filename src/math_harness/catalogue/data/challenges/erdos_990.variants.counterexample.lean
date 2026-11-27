import Mathlib

open Polynomial

open scoped Real

namespace Erdos990

open scoped Classical in
noncomputable def rootArgCount (f : ℂ[X]) (I : Set ℝ) : ℕ :=
  f.roots.countP fun z =>
    (if Complex.arg z < 0 then Complex.arg z + 2 * π else Complex.arg z) ∈ I

noncomputable def M (f : ℂ[X]) : ℝ :=
  (∑ i ∈ Finset.range (f.natDegree + 1), ‖f.coeff i‖) /
    Real.sqrt (‖f.coeff 0‖ * ‖f.leadingCoeff‖)

theorem erdos_990.variants.counterexample :
    ∀ n : ℕ, 1 ≤ n → ∃ f : ℂ[X], f.coeff 0 ≠ 0 ∧ f.support.card = n ∧ M f < 3 ∧ ∃ x : ℝ, 0 < x ∧ f.rootMultiplicity (x : ℂ) = n - 1 := by
  sorry

end Erdos990
