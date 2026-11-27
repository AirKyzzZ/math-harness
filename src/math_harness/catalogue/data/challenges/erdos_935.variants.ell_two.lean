import Mathlib

open Filter

namespace Erdos935

theorem erdos_935.variants.ell_two :
    ∀ C : ℝ, ∃ᶠ n : ℕ in atTop, C * (n : ℝ) ^ 2 < ((Erdos367.B 2 (∏ m ∈ Finset.Icc n (n + 2), m) : ℕ) : ℝ) := by
  sorry

end Erdos935
