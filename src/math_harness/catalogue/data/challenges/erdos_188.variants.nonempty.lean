import Mathlib

namespace Erdos188

def s := { k : ℕ | ∃ blue : Set ℂ,
  (Set.univ \ blue).Pairwise (fun c₁ c₂ => dist c₁ c₂ ≠ 1) ∧
    ¬ (∃ᵉ (bs ⊆ blue) (z) (d), ‖d‖ = 1 ∧ bs.IsAPOfLengthWith k z d) }

theorem erdos_188.variants.nonempty :
    s.Nonempty := by
  sorry

end Erdos188
