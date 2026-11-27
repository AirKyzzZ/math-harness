import Mathlib

namespace Erdos753

open SimpleGraph

theorem erdos_753.variants.alon :
    ∃ C : ℝ, 0 < C ∧ ∀ n : ℕ, 2 ≤ n → ∃ G : SimpleGraph (Fin n), (listChromaticNumber G : ℝ) + (listChromaticNumber Gᶜ : ℝ) ≤ C * ((n : ℝ) * Real.log (n : ℝ)) ^ ((1 : ℝ) / 2) := by
  sorry

end Erdos753
