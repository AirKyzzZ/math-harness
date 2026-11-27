import Mathlib

open scoped Pointwise

open Filter

namespace Erdos757

def IsAdmissible (c : ℝ) : Prop := ∀ {A : Set ℝ}, A.Finite → (∀ B ⊆ A,
  B.ncard = 4 → 11 ≤ (B - B).ncard) → ∃ S ⊆ A, IsSidon S ∧ c * A.ncard ≤ (S.ncard : ℝ)

theorem erdos_757.variants.lowerBound {A : Set ℝ} :
    1 / (2 : ℝ) < sSup {c | IsAdmissible c} := by
  sorry

end Erdos757
