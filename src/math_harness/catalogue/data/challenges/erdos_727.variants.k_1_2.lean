import Mathlib

open scoped Nat

namespace Erdos727

theorem erdos_727.variants.k_1_2 (k : ℕ) (hk : 2 ≤ k) :
    Set.Infinite {n : ℕ | (Nat.factorial (n + k)) * (Nat.factorial (n + 1)) ∣ Nat.factorial (2 * n)} := by
  sorry

end Erdos727
