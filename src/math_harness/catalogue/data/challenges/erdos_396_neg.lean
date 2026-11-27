import Mathlib

namespace Erdos396

open Nat

theorem erdos_396_neg :
    ¬ (∀ k : ℕ, ∃ n : ℕ, descFactorial n (k + 1) ∣ centralBinom n) := by
  sorry

-- TODO(firsching): formalise the additional material

end Erdos396
