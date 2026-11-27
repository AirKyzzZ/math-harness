import Mathlib

open Filter Asymptotics

open scoped Pointwise

namespace Erdos1109

noncomputable def f (N : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ A : Finset ℕ,
    A ⊆ Finset.Icc 1 N ∧ (∀ n ∈ A + A, Squarefree n) ∧ A.card = k}

theorem erdos_1109.variants.erdos_sarkozy_upper :
    (fun N : ℕ => (f N : ℝ)) ≪ fun N : ℕ => (N : ℝ) ^ ((3 : ℝ) / 4) * Real.log N := by
  sorry

end Erdos1109
