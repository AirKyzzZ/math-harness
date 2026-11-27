import Mathlib

namespace Erdos1134

def A : Set ℕ :=
  ⋂₀ {S : Set ℕ | 1 ∈ S ∧ ∀ x ∈ S, 2 * x + 1 ∈ S ∧ 3 * x + 1 ∈ S ∧ 6 * x + 1 ∈ S}

theorem erdos_1134.variants.klarner_neg :
    ¬ (¬ 0 < (⋂₀ {S : Set ℕ | 0 ∈ S ∧ ∀ x ∈ S, 2 * x ∈ S ∧ 3 * x + 2 ∈ S ∧ 6 * x + 3 ∈ S}).lowerDensity) := by
  sorry

end Erdos1134
