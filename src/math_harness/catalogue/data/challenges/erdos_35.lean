import Mathlib

open Set Pointwise

namespace Erdos35

open scoped Classical in
theorem erdos_35 :
    ∀ (B : Set ℕ) (k : ℕ), 0 ∈ B → B.IsAddBasisOfOrder k → ∀ A : Set ℕ, schnirelmannDensity A + schnirelmannDensity A * (1 - schnirelmannDensity A) / k ≤ schnirelmannDensity (A + B) := by
  sorry

end Erdos35
