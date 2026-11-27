import Mathlib

open Filter Set

namespace Erdos1133

theorem erdos_1133.variants.weaker :
    ∀ C > (0 : ℝ), ∃ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, let m := ⌊(1 + ε) * (n : ℝ)⌋₊; ∀ x : Fin m → Icc (-1 : ℝ) 1, ∃ P : Polynomial ℝ, P.natDegree = n ∧ (∀ i : Fin m, |P.eval (x i : ℝ)| ≤ 1) ∧ ∃ z ∈ Icc (-1 : ℝ) 1, |P.eval z| > C := by
  sorry

end Erdos1133
