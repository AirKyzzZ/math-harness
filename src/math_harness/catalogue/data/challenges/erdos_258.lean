import Mathlib

namespace Erdos258

theorem erdos_258 :
    ∀ (a : ℕ → ℕ), (∀ n, 2 ≤ a n) → Filter.Tendsto a Filter.atTop Filter.atTop → Irrational (∑' (n : ℕ), ((n + 1).divisors.card / ∏ i ∈ Finset.Icc 1 (n + 1), a i)) := by
  sorry

end Erdos258
