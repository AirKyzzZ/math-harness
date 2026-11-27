import Mathlib

open scoped Nat

namespace Erdos727

theorem erdos_727_neg :
    ¬ (∀ k ≥ 2, Set.Infinite {n : ℕ | (Nat.factorial (n + k)) ^ 2 ∣ Nat.factorial (2 * n)}) := by
  sorry

end Erdos727
