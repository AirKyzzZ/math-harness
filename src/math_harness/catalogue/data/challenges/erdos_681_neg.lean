import Mathlib

namespace Erdos681

def IsLPF (p m : ℕ) : Prop := p.Prime ∧ p ∣ m ∧ ∀ q, q.Prime ∧ q ∣ m → p ≤ q

theorem erdos_681_neg :
    ¬ (∀ᶠ n in .atTop, ∃ k > 0, (n + k).Composite ∧ ∀ p, IsLPF p (n + k) → p > k ^ 2) := by
  sorry

end Erdos681
