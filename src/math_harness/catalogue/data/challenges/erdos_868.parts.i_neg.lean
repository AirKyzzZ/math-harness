import Mathlib

open Filter

open scoped Pointwise

namespace Erdos868

noncomputable

def ncard_add_repr (A : Set ℕ) (o : ℕ) (n : ℕ) : ℕ :=
  { a : Fin o → ℕ | Monotone a ∧ Set.range a ⊆ A ∧ ∑ i, a i = n }.ncard

theorem erdos_868.parts.i_neg :
    ¬ (¬ ∀ (A : Set ℕ), A.IsAsymptoticAddBasisOfOrder 2 → atTop.Tendsto (fun n => ncard_add_repr A 2 n) atTop → ∃ B ⊆ A, B.IsAsymptoticAddBasisOfOrder 2 ∧ ∀ b ∈ B, ¬(B \ {b}).IsAsymptoticAddBasisOfOrder 2) := by
  sorry

end Erdos868
