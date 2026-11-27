import Mathlib

open Filter Asymptotics

open scoped Pointwise

namespace Erdos1109

noncomputable def f (N : ℕ) : ℕ :=
  sSup {k : ℕ | ∃ A : Finset ℕ,
    A ⊆ Finset.Icc 1 N ∧ (∀ n ∈ A + A, Squarefree n) ∧ A.card = k}

theorem erdos_1109.variants.erdos_sarkozy_lower :
    (fun N : ℕ => Real.log N) ≪ fun N : ℕ => (f N : ℝ) := by
  sorry

end Erdos1109
