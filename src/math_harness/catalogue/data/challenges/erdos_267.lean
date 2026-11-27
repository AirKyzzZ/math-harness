import Mathlib

namespace Erdos267

theorem erdos_267 :
    ∀ᵉ (n : ℕ → ℕ) (c > (1 : ℚ)), StrictMono n → (∀ k, c ≤ n (k+1) / n k) → Irrational (∑' k, 1 / (Nat.fib <| n k)) := by
  sorry

end Erdos267
