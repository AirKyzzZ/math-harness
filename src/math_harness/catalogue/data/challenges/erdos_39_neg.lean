import Mathlib

namespace Erdos39

open Filter

theorem erdos_39_neg :
    ¬ (∃ (A : Set ℕ), A.Infinite ∧ IsSidon A ∧ ∀ᵉ (ε > (0 : ℝ)), (· ^ (1 / 2 - ε) : ℕ → ℝ) =O[atTop] fun N => (((Set.Icc 1 N) ∩ A).ncard : ℝ)) := by
  sorry

-- TODO(firsching): add the various known bounds as variants.

end Erdos39
