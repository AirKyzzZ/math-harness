import Mathlib

open Filter

namespace Erdos402

theorem erdos_402 (A : Finset ℕ) (h₁ : 0 ∉ A) (h₂ : A.Nonempty) :
    ∃ᵉ (a ∈ A) (b ∈ A), a.gcd b ≤ (a / A.card : ℚ) := by
  sorry

end Erdos402
