import Mathlib

namespace Erdos370

theorem erdos_370 :
    { n | Nat.maxPrimeFac n < √n ∧ Nat.maxPrimeFac (n + 1) < √(n + 1) }.Infinite := by
  sorry

end Erdos370
