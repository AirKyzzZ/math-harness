import Mathlib

open Filter Real

namespace Erdos233

theorem erdos_233.variants.upper_bound_unconditional :
    (fun N => ((∑ n ∈ Finset.range N, (primeGap n) ^ 2) : ℝ)) =O[atTop] fun N => N * (log N)^4 := by
  sorry

end Erdos233
