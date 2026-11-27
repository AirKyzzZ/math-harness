import Mathlib

open MeasureTheory

namespace Erdos999

def IsApproximable (f : ℕ → ℝ) (x : ℝ) : Prop :=
  {q : ℕ | 0 < q ∧ ∃ p : ℤ, Int.gcd p q = 1 ∧ |x - p / q| < f q / q}.Infinite

theorem erdos_999.variants.erdos (f : ℕ → ℝ) (hf : ∀ q, 0 ≤ f q) (hb : ∃ C : ℝ, ∀ q, f q * q ≤ C) :
    (∀ᵐ x : ℝ, IsApproximable f x) ↔ ¬ Summable fun q : ℕ ↦ (Nat.totient q : ℝ) * f q / q := by
  sorry

end Erdos999
