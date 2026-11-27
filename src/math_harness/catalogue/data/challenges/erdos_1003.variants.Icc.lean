import Mathlib

namespace Erdos1003

open scoped Nat

open Filter

theorem erdos_1003.variants.Icc :
    ∀ k ≥ 1, {n | ∀ i ∈ Set.Icc 1 k, φ n = φ (n + i)}.Infinite := by
  sorry

end Erdos1003
