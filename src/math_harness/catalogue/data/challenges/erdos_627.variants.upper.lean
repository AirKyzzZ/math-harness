import Mathlib

open Filter SimpleGraph

open scoped Topology Asymptotics

namespace Erdos627

noncomputable def maxChromaticCliqueRatio (n : ℕ) : ℝ :=
  ⨆ G : SimpleGraph (Fin n), (G.chromaticNumber.toNat : ℝ) / (G.cliqueNum : ℝ)

theorem erdos_627.variants.upper :
    ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, maxChromaticCliqueRatio n ≤ (4 + ε) * ((n : ℝ) / Real.logb 2 n ^ 2) := by
  sorry

theorem erdos_627.variants.tutte_zykov :
    ∀ k : ℕ, 2 ≤ k → ∃ (n : ℕ) (G : SimpleGraph (Fin n)),
      G.cliqueNum = 2 ∧ G.chromaticNumber = (k : ℕ∞) := by
  exact exists_cliqueNum_eq_two_chromaticNumber_eq

end Erdos627
