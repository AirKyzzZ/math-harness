import Mathlib

open Filter Real Polynomial

open scoped ArithmeticFunction.sigma Topology

namespace Erdos975

noncomputable def Erdos975Sum (f : ℤ[X]) (x : ℝ) : ℝ :=
  ∑ n ≤ ⌊x⌋₊, σ 0 ⌊f.eval ↑n⌋₊

theorem erdos_975.variants.lower_bound (f : ℤ[X]) (hf : Irreducible f) (hfdeg : f.natDegree ≠ 0) (hf_pos : ∀ᶠ n in atTop, 1 ≤ f.eval n) :
    (fun x ↦ x * log x) =O[atTop] Erdos975Sum f := by
  sorry

-- The constant is only known in terms of Hurwitz class numbers, which are not yet formalized

-- (see the `TODO` below), so the answer stays a placeholder.

end Erdos975
