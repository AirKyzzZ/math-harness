import Mathlib

namespace Erdos732

open Filter Asymptotics

theorem erdos_732.parts.ii :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ n : ℕ in atTop, Real.exp (c * Real.sqrt n * Real.log n) ≤ (Hypergraph.blockSizeProfiles n).card := by
  sorry

end Erdos732
