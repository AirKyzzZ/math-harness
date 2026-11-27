import Mathlib

open Filter

namespace Erdos927

noncomputable def g (n : ℕ) : ℕ := by
  classical
  exact Finset.sup (Finset.univ (α := SimpleGraph (Fin n)))
    fun G => (SimpleGraph.cliqueSizes G).ncard

theorem erdos_927_neg :
    ¬ (¬ ∃ C : ℕ, ∀ᶠ n : ℕ in atTop, g n + Nat.log 2 n + Nat.iteratedLog 2 n ≤ n + C ∧ n ≤ g n + Nat.log 2 n + Nat.iteratedLog 2 n + C) := by
  sorry

end Erdos927
