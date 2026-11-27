import Mathlib

open EuclideanGeometry

namespace Erdos213

def Erdos213For (n : ℕ) : Prop := ∃ S : Set ℝ², S.Finite ∧ S.ncard = n ∧
    NonTrilinear S ∧
    (∀ Q : Set ℝ², Q ⊆ S ∧ Q.ncard = 4 → ¬ EuclideanGeometry.Cospherical Q) ∧
    (S.Pairwise fun p₁ p₂ => dist p₁ p₂ ∈ Set.range Int.cast)

theorem erdos_213.variants.KK08 :
    Erdos213For 7 := by
  sorry

end Erdos213
