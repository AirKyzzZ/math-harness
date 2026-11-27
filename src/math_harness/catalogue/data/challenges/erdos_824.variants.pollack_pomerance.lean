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

theorem erdos_824.variants.pollack_pomerance :
    Tendsto (fun x : ℕ ↦ (h x : ℝ) / (x : ℝ)) atTop atTop := by
  sorry

end Erdos824
