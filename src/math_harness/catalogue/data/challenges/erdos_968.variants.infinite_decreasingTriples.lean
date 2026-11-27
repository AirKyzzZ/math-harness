import Mathlib

open Filter Real

open scoped BigOperators

namespace Erdos968

noncomputable def u (n : ℕ) : ℝ :=
  (n.nth Nat.Prime : ℝ) / (n + 1)

theorem erdos_968.variants.infinite_decreasingTriples :
    {n : ℕ | u n > u (n + 1) ∧ u (n + 1) > u (n + 2)}.Infinite := by
  sorry

end Erdos968
