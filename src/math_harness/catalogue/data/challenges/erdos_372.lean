import Mathlib

namespace Erdos372

theorem erdos_372 :
    {n : ℕ | Nat.maxPrimeFac n > Nat.maxPrimeFac (n + 1) ∧ Nat.maxPrimeFac (n + 1) > Nat.maxPrimeFac (n + 2)}.Infinite := by
  sorry

end Erdos372
