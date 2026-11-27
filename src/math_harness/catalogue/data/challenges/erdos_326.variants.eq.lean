import Mathlib

open Filter

open scoped Topology

namespace Erdos326

-- Formalisation note: This is trivially true for `x = 0` by taking `a = id`. Cassels' proof

-- shows it for `0 < x` which is more interesting.

theorem erdos_326.variants.eq :
    ∃ (a : ℕ → ℕ) (_ : StrictMono a) (_ : Set.range a |>.IsAddBasisOfOrder 2) (x : ℝ) (_ : 0 < x), Tendsto (fun n ↦ (a n : ℝ) / n ^ 2) atTop (𝓝 x) := by
  sorry

end Erdos326
