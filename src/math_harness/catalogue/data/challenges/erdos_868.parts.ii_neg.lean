import Mathlib

open Filter

open scoped Pointwise

namespace Erdos868

noncomputable

def ncard_add_repr (A : Set ℕ) (o : ℕ) (n : ℕ) : ℕ :=
  { a : Fin o → ℕ | Monotone a ∧ Set.range a ⊆ A ∧ ∑ i, a i = n }.ncard

theorem erdos_868.parts.ii_neg :
    ¬ (¬ ∀ᵉ (A : Set ℕ) (ε > 0), A.IsAsymptoticAddBasisOfOrder 2 → (∀ᶠ (n : ℕ) in atTop, ε * Real.log n < ncard_add_repr A 2 n) → ∃ B ⊆ A, B.IsAsymptoticAddBasisOfOrder 2 ∧ ∀ b ∈ B, ¬(B \ {b}).IsAsymptoticAddBasisOfOrder 2) := by
  sorry

end Erdos868
