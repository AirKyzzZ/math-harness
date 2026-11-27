import Mathlib

namespace Erdos1134

def A : Set ℕ :=
  ⋂₀ {S : Set ℕ | 1 ∈ S ∧ ∀ x ∈ S, 2 * x + 1 ∈ S ∧ 3 * x + 1 ∈ S ∧ 6 * x + 1 ∈ S}

theorem erdos_1134 :
    ¬ 0 < A.lowerDensity := by
  sorry

end Erdos1134
