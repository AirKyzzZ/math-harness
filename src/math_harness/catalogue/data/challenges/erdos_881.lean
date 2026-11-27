import Mathlib

open Set

namespace Erdos881

def IsMinimalAsymptoticAddBasisOfOrder (k : ℕ) (A : Set ℕ) : Prop :=
  A.IsAsymptoticAddBasisOfOrder k ∧
    ∀ ⦃B : Set ℕ⦄, B ⊆ A → B.Infinite → ¬ (A \ B).IsAsymptoticAddBasisOfOrder k

theorem erdos_881 :
    ∀ (k : ℕ) (A : Set ℕ), IsMinimalAsymptoticAddBasisOfOrder k A → ∃ (B : Set ℕ), B ⊆ A ∧ B.Infinite ∧ (A \ B).IsAsymptoticAddBasisOfOrder (k + 1) := by
  sorry

end Erdos881
