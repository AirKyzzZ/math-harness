import Mathlib

open Filter

namespace Erdos986

theorem erdos_986 :
    ∀ (s : ℕ) (hs : 3 ≤ s), ∃ (c C : ℝ), 0 < c ∧ 0 < C ∧ ∀ᶠ (k : ℕ) in atTop, (SimpleGraph.classicalRamsey s k : ℝ) ≥ C * (k : ℝ) ^ (s - 1) / (Real.log k) ^ c := by
  sorry

-- TODO: Add variants of the problem.

end Erdos986
