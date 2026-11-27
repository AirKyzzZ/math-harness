import Mathlib

open Filter Asymptotics

namespace Erdos121

noncomputable def F (k N : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 N ∧
    (∀ S ⊆ A, S.card = k → ¬ IsSquare (∏ n ∈ S, n)) ∧ A.card = m}

theorem erdos_121.variants.two :
    (fun N : ℕ => (F 2 N : ℝ)) ~[atTop] fun N : ℕ => 6 / Real.pi ^ 2 * N := by
  sorry

end Erdos121
