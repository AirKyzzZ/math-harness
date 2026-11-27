import Mathlib

open Filter Asymptotics

namespace Erdos121

noncomputable def F (k N : ℕ) : ℕ :=
  sSup {m : ℕ | ∃ A : Finset ℕ, A ⊆ Finset.Icc 1 N ∧
    (∀ S ⊆ A, S.card = k → ¬ IsSquare (∏ n ∈ S, n)) ∧ A.card = m}

theorem erdos_121.variants.tao (k : ℕ) (hk : 4 ≤ k) :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ N : ℕ in atTop, (F k N : ℝ) ≤ (1 - c) * N := by
  sorry

end Erdos121
