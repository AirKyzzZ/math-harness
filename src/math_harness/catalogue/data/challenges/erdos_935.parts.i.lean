import Mathlib

open Filter

namespace Erdos935

theorem erdos_935.parts.i :
    ∀ ε : ℝ, 0 < ε → ∀ ℓ : ℕ, 1 ≤ ℓ → ∀ᶠ n : ℕ in atTop, ((Erdos367.B 2 (∏ m ∈ Finset.Icc n (n + ℓ), m) : ℕ) : ℝ) < (n : ℝ) ^ (2 + ε) := by
  sorry

end Erdos935
