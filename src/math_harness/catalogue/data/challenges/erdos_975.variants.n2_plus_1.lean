import Mathlib

open Filter Real Polynomial

open scoped ArithmeticFunction.sigma Topology

namespace Erdos975

noncomputable def Erdos975Sum (f : ℤ[X]) (x : ℝ) : ℝ :=
  ∑ n ≤ ⌊x⌋₊, σ 0 ⌊f.eval ↑n⌋₊

-- The constant is only known in terms of Hurwitz class numbers, which are not yet formalized

-- (see the `TODO` below), so the answer stays a placeholder.

theorem erdos_975.variants.n2_plus_1 :
    ∃ c > (0 : ℝ), Tendsto (fun x ↦ Erdos975Sum (X ^ 2 + 1) x / (x * log x)) atTop (𝓝 c) := by
  sorry

end Erdos975
