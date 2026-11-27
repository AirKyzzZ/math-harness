import Mathlib

open Filter

namespace Erdos940

theorem erdos_940.variants.three_cubes :
    {n : ℕ | ∃ (S : Multiset ℕ), S.card ≤ 3 ∧ n = (Multiset.map (· ^ 3) S).sum}.HasDensity 0 := by
  sorry

end Erdos940
