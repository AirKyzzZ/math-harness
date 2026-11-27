import Mathlib

open Filter

namespace Erdos670

def HasSeparatedDistances {X : Type*} [MetricSpace X] (A : Finset X) : Prop :=
  ∀ a ∈ A, ∀ b ∈ A, ∀ c ∈ A, ∀ e ∈ A, a ≠ b → c ≠ e → s(a, b) ≠ s(c, e) →
    1 ≤ |dist a b - dist c e|

theorem erdos_670 :
    ∀ d : ℕ, 1 ≤ d → ∀ ε > (0 : ℝ), ∀ᶠ n : ℕ in atTop, ∀ A : Finset (EuclideanSpace ℝ (Fin d)), A.card = n → HasSeparatedDistances A → (1 - ε) * (n : ℝ) ^ 2 ≤ Metric.diam (A : Set (EuclideanSpace ℝ (Fin d))) := by
  sorry

end Erdos670
