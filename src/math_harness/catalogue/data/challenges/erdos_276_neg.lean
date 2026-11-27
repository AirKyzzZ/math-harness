import Mathlib

namespace Erdos276

def IsLucasSequence (L : ℕ → ℕ) : Prop := ∀ n, L (n + 2) = L (n + 1) + L n

theorem erdos_276_neg :
    ¬ (∃ (a : ℕ → ℕ), IsLucasSequence a ∧ (∀ k, (a k).Composite) ∧ (∀ n > 1, ∃ k, Nat.gcd n (a k) = 1)) := by
  sorry

end Erdos276
