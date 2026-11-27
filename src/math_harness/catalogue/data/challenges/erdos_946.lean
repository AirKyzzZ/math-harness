import Mathlib

open Filter Real

open scoped ArithmeticFunction.sigma

namespace Erdos946

theorem erdos_946 :
    {n : ℕ | σ 0 n = σ 0 (n + 1)}.Infinite := by
  sorry

noncomputable def erdos946Count (x : ℝ) : ℝ :=
  ((Finset.range (⌊x⌋₊ + 1)).filter (fun n => σ 0 n = σ 0 (n + 1))).card

end Erdos946
