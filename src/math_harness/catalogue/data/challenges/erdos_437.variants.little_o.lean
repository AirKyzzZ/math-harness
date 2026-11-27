import Mathlib

open Filter Real

namespace Erdos437

def squarePartialProducts (a : List ℕ) : ℕ :=
  ((Finset.range a.length).filter fun i ↦ IsSquare (a.take (i + 1)).prod).card

noncomputable def L (x : ℕ) : ℕ :=
  sSup {m | ∃ a : List ℕ, a.Pairwise (· < ·) ∧ (∀ n ∈ a, n ∈ Finset.Icc 1 x) ∧
    squarePartialProducts a = m}

theorem erdos_437.variants.little_o :
    (fun x : ℕ ↦ (L x : ℝ)) =o[atTop] fun x : ℕ ↦ (x : ℝ) := by
  sorry

end Erdos437
