import Mathlib

open Filter Real

namespace Erdos437

def squarePartialProducts (a : List ℕ) : ℕ :=
  ((Finset.range a.length).filter fun i ↦ IsSquare (a.take (i + 1)).prod).card

noncomputable def L (x : ℕ) : ℕ :=
  sSup {m | ∃ a : List ℕ, a.Pairwise (· < ·) ∧ (∀ n ∈ a, n ∈ Finset.Icc 1 x) ∧
    squarePartialProducts a = m}

theorem erdos_437.variants.tao :
    ∃ o₁ o₂ : ℕ → ℝ, Tendsto o₁ atTop (nhds 0) ∧ Tendsto o₂ atTop (nhds 0) ∧ ∀ᶠ x : ℕ in atTop, x * exp (-(√2 + o₁ x) * √(log x * log (log x))) ≤ L x ∧ L x ≤ x * exp (-((√2)⁻¹ + o₂ x) * √(log x * log (log x))) := by
  sorry

end Erdos437
