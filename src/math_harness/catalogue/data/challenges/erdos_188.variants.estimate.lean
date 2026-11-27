import Mathlib

namespace Erdos188

def s := { k : ℕ | ∃ blue : Set ℂ,
  (Set.univ \ blue).Pairwise (fun c₁ c₂ => dist c₁ c₂ ≠ 1) ∧
    ¬ (∃ᵉ (bs ⊆ blue) (z) (d), ‖d‖ = 1 ∧ bs.IsAPOfLengthWith k z d) }

theorem erdos_188.variants.estimate :
    (∀ k, k ∈ s → 5 ≤ k) ∧ (∃ k ∈ s, k ≤ 10000000) := by
  sorry

end Erdos188
