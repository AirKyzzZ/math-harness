import Mathlib

open Filter

namespace Erdos88

theorem erdos_88.variants.kwan_sah_sauermann_sawhney :
    ∀ C > (0 : ℝ), ∀ η > (0 : ℝ), ∀ᶠ n : ℕ in atTop, ∀ G : SimpleGraph (Fin n), (G.cliqueNum : ℝ) < C * Real.logb 2 n → (G.indepNum : ℝ) < C * Real.logb 2 n → ∀ m : ℕ, (m : ℝ) ≤ (1 - η) * G.edgeSet.ncard → ∃ S : Finset (Fin n), (G.induce (S : Set (Fin n))).edgeSet.ncard = m := by
  sorry

end Erdos88
