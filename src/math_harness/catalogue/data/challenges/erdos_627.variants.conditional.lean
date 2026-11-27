import Mathlib

open Filter SimpleGraph

open scoped Topology Asymptotics

namespace Erdos627

noncomputable def maxChromaticCliqueRatio (n : ℕ) : ℝ :=
  ⨆ G : SimpleGraph (Fin n), (G.chromaticNumber.toNat : ℝ) / (G.cliqueNum : ℝ)

theorem erdos_627.variants.conditional (ℓ : ℝ) (hR : ∀ s t k : ℕ, s * t ≤ k ^ 2 → classicalRamsey s t ≤ diagonalRamsey k) (hlim : Tendsto (fun k : ℕ ↦ Real.logb 2 (diagonalRamsey k : ℝ) / (k : ℝ)) atTop (𝓝 ℓ)) :
    Tendsto (fun n : ℕ ↦ maxChromaticCliqueRatio n / ((n : ℝ) / Real.logb 2 n ^ 2)) atTop (𝓝 (ℓ ^ 2)) := by
  sorry

theorem erdos_627.variants.tutte_zykov :
    ∀ k : ℕ, 2 ≤ k → ∃ (n : ℕ) (G : SimpleGraph (Fin n)),
      G.cliqueNum = 2 ∧ G.chromaticNumber = (k : ℕ∞) := by
  exact exists_cliqueNum_eq_two_chromaticNumber_eq

end Erdos627
