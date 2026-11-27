import Mathlib

open Filter Real

namespace Erdos437

def squarePartialProducts (a : List ℕ) : ℕ :=
  ((Finset.range a.length).filter fun i ↦ IsSquare (a.take (i + 1)).prod).card

noncomputable def L (x : ℕ) : ℕ :=
  sSup {m | ∃ a : List ℕ, a.Pairwise (· < ·) ∧ (∀ n ∈ a, n ∈ Finset.Icc 1 x) ∧
    squarePartialProducts a = m}

theorem erdos_437 :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ x : ℕ in atTop, (x : ℝ) ^ (1 - ε) < L x := by
  sorry

end Erdos437
