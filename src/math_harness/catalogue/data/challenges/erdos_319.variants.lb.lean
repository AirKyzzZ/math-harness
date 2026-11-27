import Mathlib

open Filter

open scoped Topology Finset Real

namespace Erdos319

-- Formalisation note: it's possible that solution to `erdos_319` needs to be

-- expressed asymptotically. To handle this we include an `IsTheta` variant below.

def erdos_319.variants.isTheta.answer : ℕ → ℝ := fun N ↦ (N : ℝ)

theorem erdos_319.variants.lb :
    ∃ (o : ℕ → ℝ), (o =o[atTop] (1 : ℕ → ℝ)) ∧ ∀ᶠ N in atTop, (1 - 1 / rexp 1 + o N) * N ≤ sSup { (#A : ℝ) | (A) (_ : A ⊆ Finset.Icc 1 N) (_ : ∃ δ : ℕ → ℤˣ, ∑ n ∈ A, (δ n : ℚ) / n = 0 ∧ ∀ A' ⊂ A, A'.Nonempty → ∑ n ∈ A', (δ n : ℚ) / n ≠ 0) } := by
  sorry

end Erdos319
