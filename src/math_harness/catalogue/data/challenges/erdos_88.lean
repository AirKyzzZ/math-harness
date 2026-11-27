import Mathlib

open Filter

namespace Erdos88

theorem erdos_88 :
    ∀ ε > (0 : ℝ), ∃ δ > (0 : ℝ), ∀ n : ℕ, ∀ G : SimpleGraph (Fin n), (G.cliqueNum : ℝ) < ε * Real.log n → (G.indepNum : ℝ) < ε * Real.log n → ∀ m : ℕ, (m : ℝ) ≤ δ * n ^ 2 → ∃ S : Finset (Fin n), (G.induce (S : Set (Fin n))).edgeSet.ncard = m := by
  sorry

end Erdos88
