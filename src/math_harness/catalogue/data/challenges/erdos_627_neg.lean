import Mathlib

open Filter SimpleGraph

open scoped Topology Asymptotics

namespace Erdos627

noncomputable def maxChromaticCliqueRatio (n : ℕ) : ℝ :=
  ⨆ G : SimpleGraph (Fin n), (G.chromaticNumber.toNat : ℝ) / (G.cliqueNum : ℝ)

theorem erdos_627_neg :
    ¬ (∃ L : ℝ, Tendsto (fun n : ℕ ↦ maxChromaticCliqueRatio n / ((n : ℝ) / Real.logb 2 n ^ 2)) atTop (𝓝 L)) := by
  sorry

theorem erdos_627.variants.tutte_zykov :
    ∀ k : ℕ, 2 ≤ k → ∃ (n : ℕ) (G : SimpleGraph (Fin n)),
      G.cliqueNum = 2 ∧ G.chromaticNumber = (k : ℕ∞) := by
  exact exists_cliqueNum_eq_two_chromaticNumber_eq

end Erdos627
