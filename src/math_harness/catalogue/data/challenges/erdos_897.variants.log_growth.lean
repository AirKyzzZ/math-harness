import Mathlib

-- TODO(lezeau): add `ArithmeticFunction.IsAdditive` to `ForMathlib`

namespace Erdos897

theorem erdos_897.variants.log_growth (f : ℕ → ℝ) (hf : ∀ᵉ (a > 0) (b > 0), a.Coprime b → f (a * b) = f a + f b) (C : ℝ) (hf' : ∀ n, |f (n+1) - f n| ≤ C) :
    ∃ c, ∃ (O : ℕ → ℝ), O =O[Filter.atTop] (1 : ℕ → ℝ) ∧ ∀ n, f n ≤ c*Real.log n + O n := by
  sorry

end Erdos897
