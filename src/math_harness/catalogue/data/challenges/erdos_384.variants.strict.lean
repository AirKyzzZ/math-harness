import Mathlib

namespace Erdos384

theorem erdos_384.variants.strict :
    ¬ ∀ n k : ℕ, 1 < k → k < n - 1 → (n, k) ≠ (7, 3) → (n, k) ≠ (7, 4) → ∃ p : ℕ, p.Prime ∧ p ∣ n.choose k ∧ 2 * p < n := by
  sorry

end Erdos384
