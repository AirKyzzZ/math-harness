import Mathlib

open MeasureTheory

namespace Erdos999

def IsApproximable (f : ℕ → ℝ) (x : ℝ) : Prop :=
  {q : ℕ | 0 < q ∧ ∃ p : ℤ, Int.gcd p q = 1 ∧ |x - p / q| < f q / q}.Infinite

theorem erdos_999 :
    ∀ f : ℕ → ℝ, (∀ q, 0 ≤ f q) → ((∀ᵐ x : ℝ, IsApproximable f x) ↔ ¬ Summable fun q : ℕ ↦ (Nat.totient q : ℝ) * f q / q) := by
  sorry

end Erdos999
