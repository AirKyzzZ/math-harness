import Mathlib

open Filter

namespace Erdos369

theorem erdos_369_neg :
    ¬ (∀ (ε : ℝ) (hε : 0 < ε) (k : ℕ) (hk : 2 ≤ k), ∀ᶠ (n : ℕ) in atTop, ∃ a : ℕ, n / 2 ≤ a + 1 ∧ a + k ≤ n ∧ ∀ j < k, ∀ p ∈ (a + 1 + j).primeFactors, (p : ℝ) ≤ (n : ℝ) ^ ε) := by
  sorry

end Erdos369
