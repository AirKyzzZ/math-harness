import Mathlib

namespace Erdos370

theorem erdos_370_neg :
    ¬ ({ n | Nat.maxPrimeFac n < √n ∧ Nat.maxPrimeFac (n + 1) < √(n + 1) }.Infinite) := by
  sorry

end Erdos370
