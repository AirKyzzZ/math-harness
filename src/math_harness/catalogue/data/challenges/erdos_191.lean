import Mathlib

open Filter

namespace Erdos191

theorem erdos_191 :
    ∀ C : ℝ, 0 < C → ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Finset.Icc 2 n), ∃ X : Finset (Finset.Icc 2 n), (G.IsClique X ∨ G.IsIndepSet X) ∧ C ≤ ∑ x ∈ X, 1 / Real.log (x : ℕ) := by
  sorry

end Erdos191
