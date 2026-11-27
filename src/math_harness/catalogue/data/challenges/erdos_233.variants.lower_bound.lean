import Mathlib

open Filter Real

namespace Erdos233

theorem erdos_233.variants.lower_bound :
    (fun (N : ℕ) => N * (log N)^2) =O[atTop] (fun N => ((∑ n ∈ Finset.range N, (primeGap n) ^ 2) : ℝ)) := by
  sorry

end Erdos233
