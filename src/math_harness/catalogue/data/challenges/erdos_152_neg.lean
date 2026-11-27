import Mathlib

open scoped Pointwise Asymptotics

open Filter

namespace Erdos152

noncomputable def f (n : ℕ) : ℕ :=
  ⨅ A : {A : Set ℕ | A.ncard = n ∧ IsSidon A},
  {s : ℕ | s - 1 ∉ A.1 + A.1 ∧ s ∈ A.1 + A.1 ∧ s + 1 ∉ A.1 + A.1}.ncard

theorem erdos_152_neg :
    ¬ (Tendsto f atTop atTop) := by
  sorry

end Erdos152
