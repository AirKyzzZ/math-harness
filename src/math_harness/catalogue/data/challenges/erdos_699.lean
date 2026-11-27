import Mathlib

namespace Erdos699

theorem erdos_699 :
    ∀ n i j : ℕ, 1 ≤ i → i < j → j ≤ n / 2 → ∃ p : ℕ, p.Prime ∧ i ≤ p ∧ p ∣ Nat.gcd (Nat.choose n i) (Nat.choose n j) := by
  sorry

end Erdos699
