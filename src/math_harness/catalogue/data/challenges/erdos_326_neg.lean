import Mathlib

open Filter

open scoped Topology

namespace Erdos326

theorem erdos_326_neg :
    ¬ (∃ (a : ℕ → ℕ), StrictMono a ∧ Minimal (fun A : Set ℕ ↦ A.IsAsymptoticAddBasisOfOrder 2) (Set.range a) ∧ ∃ (c : ℝ), c ≠ 0 ∧ Tendsto (fun n ↦ (a n : ℝ) / n ^ 2) atTop (𝓝 c)) := by
  sorry

-- Formalisation note: This is trivially true for `x = 0` by taking `a = id`. Cassels' proof

-- shows it for `0 < x` which is more interesting.

end Erdos326
