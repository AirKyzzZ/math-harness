import Mathlib

open Filter

namespace Erdos921

theorem erdos_921 :
    ∀ (k : ℕ), 4 ≤ k → ∃ (c₁ c₂ : ℝ), 0 < c₁ ∧ 0 < c₂ ∧ (∀ᶠ (n : ℕ) in atTop, (∃ (G : SimpleGraph (Fin n)), G.chromaticNumber = (k : ℕ∞) ∧ ∀ l ∈ G.oddCycleLengths, c₁ * (n : ℝ) ^ (1 / ((k : ℝ) - 2)) < (l : ℝ))) ∧ (∀ᶠ (n : ℕ) in atTop, ∀ (G : SimpleGraph (Fin n)), G.chromaticNumber = (k : ℕ∞) → ∃ l ∈ G.oddCycleLengths, (l : ℝ) ≤ c₂ * (n : ℝ) ^ (1 / ((k : ℝ) - 2))) := by
  sorry

-- TODO: Add variants of the problem.

end Erdos921
