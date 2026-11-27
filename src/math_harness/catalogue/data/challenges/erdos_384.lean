import Mathlib

namespace Erdos384

theorem erdos_384 (n k : ℕ) (hk : 1 < k) (hkn : k < n - 1) (h₃ : (n, k) ≠ (7, 3)) (h₄ : (n, k) ≠ (7, 4)) :
    ∃ p : ℕ, p.Prime ∧ p ∣ n.choose k ∧ 2 * p ≤ n := by
  sorry

end Erdos384
