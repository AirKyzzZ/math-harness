import Mathlib

open Filter

namespace Erdos191

theorem erdos_191.variants.rodl_upper :
    ∃ c : ℝ, ∀ᶠ n : ℕ in atTop, ∃ G : SimpleGraph (Finset.Icc 2 n), ∀ X : Finset (Finset.Icc 2 n), G.IsClique X ∨ G.IsIndepSet X → ∑ x ∈ X, 1 / Real.log (x : ℕ) ≤ c * Real.log (Real.log (Real.log n)) := by
  sorry

end Erdos191
