import Mathlib

open Filter

namespace Erdos935

theorem erdos_935.variants.mahler :
    ∀ ℓ : ℕ, 1 ≤ ℓ → ∀ ε : ℝ, 0 < ε → ∃ᶠ n : ℕ in atTop, (1 - ε) * (n : ℝ) ^ 2 < ((Erdos367.B 2 (∏ m ∈ Finset.Icc n (n + ℓ), m) : ℕ) : ℝ) := by
  sorry

end Erdos935
