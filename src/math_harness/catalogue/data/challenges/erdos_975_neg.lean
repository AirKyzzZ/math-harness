import Mathlib

open Filter Real Polynomial

open scoped ArithmeticFunction.sigma Topology

namespace Erdos975

noncomputable def Erdos975Sum (f : ℤ[X]) (x : ℝ) : ℝ :=
  ∑ n ≤ ⌊x⌋₊, σ 0 ⌊f.eval ↑n⌋₊

theorem erdos_975_neg :
    ¬ (∀ f : ℤ[X], f.natDegree ≠ 0 → Irreducible f → (∀ᶠ n in atTop, 1 ≤ f.eval n) → ∃ c > (0 : ℝ), Tendsto (fun x ↦ Erdos975Sum f x / (x * log x)) atTop (𝓝 c)) := by
  sorry

-- The constant is only known in terms of Hurwitz class numbers, which are not yet formalized

-- (see the `TODO` below), so the answer stays a placeholder.

end Erdos975
