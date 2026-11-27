import Mathlib

open scoped Pointwise

open Filter Finset Nat

namespace Erdos153

noncomputable def f (n : ℕ) : ℝ := ⨅ A : {A : Finset ℕ | A.card = n ∧ IsSidon (A : Set ℕ)},
  let s := (A.1 + A).orderIsoOfFin rfl
  (∑ i : Set.Ico 1 ((A.1 + A).card), (s ⟨i, i.2.2⟩ - s ⟨i - 1, by grind⟩) ^ 2 : ℝ) / ((A.1 + A).card : ℝ)

theorem erdos_153 :
    Tendsto f atTop atTop := by
  sorry

end Erdos153
