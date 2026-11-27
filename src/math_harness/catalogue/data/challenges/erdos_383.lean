import Mathlib

namespace Erdos383

theorem erdos_383 :
    ∀ k, {p : ℕ | p.Prime ∧ Nat.maxPrimeFac (∏ i ∈ Finset.Icc 0 k, (p ^ 2 + i)) = p}.Infinite := by
  sorry

end Erdos383
