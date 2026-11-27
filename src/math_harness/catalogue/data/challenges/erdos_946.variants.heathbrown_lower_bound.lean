import Mathlib

open Filter Real

open scoped ArithmeticFunction.sigma

namespace Erdos946

noncomputable def erdos946Count (x : ℝ) : ℝ :=
  ((Finset.range (⌊x⌋₊ + 1)).filter (fun n => σ 0 n = σ 0 (n + 1))).card

theorem erdos_946.variants.heathbrown_lower_bound :
    (fun x => x / (x.log)^7) =O[atTop] erdos946Count := by
  sorry

end Erdos946
