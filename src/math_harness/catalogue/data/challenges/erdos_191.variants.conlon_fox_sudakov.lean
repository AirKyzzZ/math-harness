import Mathlib

open Filter

namespace Erdos191

theorem erdos_191.variants.conlon_fox_sudakov :
    ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Finset.Icc 2 n), ∃ X : Finset (Finset.Icc 2 n), (G.IsClique X ∨ G.IsIndepSet X) ∧ 2 ^ (-8 : ℤ) * Real.log (Real.log (Real.log n)) ≤ ∑ x ∈ X, 1 / Real.log (x : ℕ) := by
  sorry

end Erdos191
