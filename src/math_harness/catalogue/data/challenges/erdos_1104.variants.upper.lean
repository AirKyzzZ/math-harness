import Mathlib

namespace Erdos1104

open Filter SimpleGraph

open scoped Real

noncomputable def triangleFreeMaxChromatic (n : ℕ) : ℕ :=
  sSup {χ | ∃ G : SimpleGraph (Fin n), G.CliqueFree 3 ∧ G.chromaticNumber = χ}

-- TODO: Add erdos_1104.

theorem erdos_1104.variants.upper :
    ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, (triangleFreeMaxChromatic n : ℝ) ≤ (2 + ε) * Real.sqrt (n : ℝ) / Real.sqrt (Real.log (n : ℝ)) := by
  sorry

end Erdos1104
