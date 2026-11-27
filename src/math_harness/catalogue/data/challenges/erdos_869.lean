import Mathlib

namespace Erdos869

theorem erdos_869 :
    ¬ ∀ (A₁ A₂ : Set ℕ), Disjoint A₁ A₂ → A₁.IsAsymptoticAddBasisOfOrder 2 → A₂.IsAsymptoticAddBasisOfOrder 2 → ∃ D ⊆ A₁ ∪ A₂, D.IsAsymptoticAddBasisOfOrder 2 ∧ ∀ d ∈ D, ¬ (D \ {d}).IsAsymptoticAddBasisOfOrder 2 := by
  sorry

end Erdos869
