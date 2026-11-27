import Mathlib

open Filter Asymptotics

open scoped Pointwise

namespace Erdos1109

noncomputable def f (N : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ A : Finset ℕ,
    A ⊆ Finset.Icc 1 N ∧ (∀ n ∈ A + A, Squarefree n) ∧ A.card = k}

theorem erdos_1109.variants.polylog :
    ∃ C > (0 : ℝ), (fun N : ℕ => (f N : ℝ)) ≪ fun N : ℕ => (Real.log N) ^ C := by
  sorry

end Erdos1109
