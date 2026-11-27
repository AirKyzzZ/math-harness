import Mathlib

open Set

namespace Erdos421

theorem erdos_421_neg :
    ¬ (∃ (d : ℕ → ℕ), StrictMono d ∧ 1 ≤ d 0 ∧ HasDensity (Set.range d) 1 ∧ {(u, v) : ℕ × ℕ | u ≤ v}.InjOn fun (u, v) => ∏ i ∈ Finset.Icc u v, d i) := by
  sorry

end Erdos421
