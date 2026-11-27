import Mathlib

namespace Erdos366

theorem exists_three_full_then_two_full : ∃ n > 0, (3).Full n ∧ (2).Full (n + 1) := by
  use 8
  norm_num +contextual [Nat.Full, Nat.primeFactors, Nat.primeFactorsList]

theorem erdos_366.variants.three_two :
    ¬ ∀ n > 0, (3).Full n ∧ (2).Full (n + 1) → n = 8 := by
  refine fun h ↦ absurd (h 12167 (by norm_num) ?_) (by norm_num)
  norm_num +contextual [Nat.Full, Nat.primeFactors, Nat.primeFactorsList]

theorem erdos_366.variants.weaker :
    ∃ n > 0, (3).Full n ∧ (3).Full (n + 1) := by
  sorry

end Erdos366
