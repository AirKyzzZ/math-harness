import Mathlib

open Filter Real

namespace Erdos233

theorem erdos_233 :
    (fun N => ((∑ n ∈ Finset.range N, (primeGap n) ^ 2) : ℝ)) =O[atTop] fun N => N * (log N)^2 := by
  sorry

end Erdos233
