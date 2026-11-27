import Mathlib

open Filter

open scoped Pointwise

namespace Erdos868

noncomputable

def ncard_add_repr (A : Set ℕ) (o : ℕ) (n : ℕ) : ℕ :=
  { a : Fin o → ℕ | Monotone a ∧ Set.range a ⊆ A ∧ ∑ i, a i = n }.ncard

theorem erdos_868.variants.Hartter_Nathanson (o : ℕ) (ho : 1 < o) :
    ∃ (A : Set ℕ), A.IsAsymptoticAddBasisOfOrder o ∧ ∀ B ⊆ A, B.IsAsymptoticAddBasisOfOrder o → ∃ b ∈ B, (B \ {b}).IsAsymptoticAddBasisOfOrder o := by
  sorry

end Erdos868
