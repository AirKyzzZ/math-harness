import Mathlib

open Filter Asymptotics

namespace Erdos121

noncomputable def F (k N : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 N ∧
    (∀ S ⊆ A, S.card = k → ¬ IsSquare (∏ n ∈ S, n)) ∧ A.card = m}

theorem erdos_121.variants.three :
    (fun N : ℕ => (F 3 N : ℝ)) ~[atTop] fun N : ℕ => (N : ℝ) := by
  sorry

end Erdos121
