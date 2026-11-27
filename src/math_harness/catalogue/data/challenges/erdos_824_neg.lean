import Mathlib

open Filter

open scoped ArithmeticFunction.sigma

namespace Erdos824

def h (x : ℕ) : ℕ :=
  ((Finset.Ico 1 x ×ˢ Finset.Ico 1 x).filter fun (a, b) ↦
    a < b ∧ a.Coprime b ∧ σ 1 a = σ 1 b).card

def hSquarefree (x : ℕ) : ℕ :=
  ((Finset.Ico 1 x ×ˢ Finset.Ico 1 x).filter fun (a, b) ↦
    a < b ∧ Squarefree a ∧ Squarefree b ∧ σ 1 a = σ 1 b).card

theorem erdos_824_neg :
    ¬ (∀ ε : ℝ, 0 < ε → ∀ᶠ x : ℕ in atTop, (x : ℝ) ^ (2 - ε) < (h x : ℝ)) := by
  sorry

end Erdos824
