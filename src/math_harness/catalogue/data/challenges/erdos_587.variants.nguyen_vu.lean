import Mathlib

namespace Erdos587

def MaxNotSqSum (N : ℕ) : ℕ :=
    (Finset.Icc 1 N |>.powerset.filter fun A => ∀ S ⊆ A, S ≠ ⊥ →
      ¬ IsSquare (∑ n ∈ S, n)).sup Finset.card

theorem erdos_587.variants.nguyen_vu :
    ∃ᵉ (O > 0) (O' > 0), ∀ᶠ N in Filter.atTop, (MaxNotSqSum N : ℝ) ≤ O' * Real.nthRoot 3 N * (N : ℝ).log^O := by
  sorry

end Erdos587
